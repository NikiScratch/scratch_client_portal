class FilemakerSyncEvents
    
    FILEMAKER_EVENTS_MAX_RESULTS_PER_PAGE = 10

    def initialize(calendar)
        @calendar = calendar
    end 

    def perform
        user = @calendar.user

        raise "fmid is nil" unless user.fmid 
        raise "non-talent user" unless user.talent?

        user.fmid_check

        event_ids = []

        client = FilemakerClient.new
        fm_layout = client["SMG_Talent_WebApp: Talent Events"] 

        page = 0

        begin
            # read and sync pending events or blackouts
            records = fm_layout.find({"_talentid" => user.fmid, "ispending" => 1, "islockedortentativeorblackout" => 1}, 
                {:max_records => FILEMAKER_EVENTS_MAX_RESULTS_PER_PAGE, :skip_records => FILEMAKER_EVENTS_MAX_RESULTS_PER_PAGE * page}) 

            break if records.empty?

            records.each do |r|

                fm_event = FilemakerEvent.new(r)    

                event_ids << fm_event.id    

                @calendar.events.where(fmid: fm_event.id).first_or_initialize(type: Event::fm_event_type(fm_event)).tap do |event|
                    event.type = Event::fm_event_type(fm_event) unless event.new_record?
                    event.fm_sync(fm_event)
                end
            end

            page += 1

        end while 1

        unless event_ids.empty?
            # cancel stale events no longer found in filemaker
            stale_events = @calendar.events.pending.where( "fmid NOT IN (?)", event_ids)
            stale_events.each { |e| e.schedule_cancel(Event::GOOGLE) }
        end
    end
end