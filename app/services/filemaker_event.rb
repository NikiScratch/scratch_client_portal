class FilemakerEvent
    def initialize(event_hash=nil)
        @hash = event_hash.nil? ? Hash.new : event_hash
    end 

    def id
        @hash["__pk_eventtalentid"].floor.to_s
    end

    def id=(id)
         @hash["__pk_eventtalentid"] = BigDecimal.new(id)
    end

    def record_id
        @hash["record_id"].floor.to_s
    end

    def record_id=(id)
         @hash["record_id"] = BigDecimal.new(id)
    end    

    def oe_id
        @hash["_opportunityeventid"]
    end

    def oe_id=(oe_id)
        @hash["_opportunityeventid"] = oe_id
    end

    def talent_id
        @hash["_talentid"]
    end

    def talent_id=(talent_id)
        @hash["_talentid"] = talent_id
    end    

    def name
        @hash["eventtalents_event::name"]
    end    

    def name=(name)
        @hash["eventtalents_event::name"] = name
    end        

    def date
        blackout? ? @hash["dateevent"] : @hash["eventtalents_event::dateevent"]
    end        

    def date=(date)
        @hash["dateevent"] = @hash["eventtalents_event::dateevent"] = date
    end      

    def date_end
        blackout? ? @hash["dateeventend"] : @hash["eventtalents_event::dateeventend"]
    end

    def date_end=(date_end)
        @hash["dateeventend"] = @hash["eventtalents_event::dateeventend"] = date_end
    end


    def time_start
        @hash["eventtalents_event::timestart"]
    end

    def time_start=(time_start)
        @hash["eventtalents_event::timestart"] = time_start
    end    

    def duration
        @hash["eventtalents_event::duration"]
    end    

    def duration=(duration)
        @hash["eventtalents_event::duration"] = duration
    end                  

    def pending?
        @hash["ispending"] == BigDecimal.new(1)
    end

    def pending=(pending)
        @hash["ispending"] = BigDecimal.new(pending)
    end    

    def locked?
        @hash["islocked"] == BigDecimal.new(1)
    end    

    def locked=(locked)
        @hash["islocked"] = BigDecimal.new(locked)
    end  

    def address
        @hash["eventtalents_event::address"]
    end  

    def address=(address)
        @hash["eventtalents_event::address"] = address
    end     

    def city
        @hash["eventtalents_event::city"]
    end  

    def city=(city)
        @hash["eventtalents_event::city"] = city
    end  

    def state
        @hash["eventtalents_event::state"]
    end  

    def state=(state)
        @hash["eventtalents_event::state"] = state
    end      

    def zip
        @hash["eventtalents_event::zip"]
    end             

    def zip=(zip)
        @hash["eventtalents_event::zip"] = zip
    end  

    def type
        @hash["eventtalents_event::eventtype"]
    end      

    def type=(type)
        @hash["eventtalents_event::eventtype"] = type
    end   

    def blackout?
        @hash["isblackout"] == BigDecimal.new(1)
    end   

    def blackout=(blackout)
        @hash["isblackout"] = BigDecimal.new(blackout)
    end

    def tentative?
        @hash["istentative"] == BigDecimal.new(1)
    end

    def tentative=(tentative)
        @hash["istentative"] = BigDecimal.new(tentative)
    end    

    def venue
        @hash["eventtalents_eventvenue::name"]
    end

    def venue=(venue)
        @hash["eventtalents_eventvenue::name"] = venue
    end

    def blackout_reason
        @hash["blackoutreason"]
    end

    def blackout_reason=(blackout_reason)
        @hash["blackoutreason"] = blackout_reason
    end 

    def lookup_event_date
        @hash["lueventdate"]
    end  

    def lookup_event_date=(date)
        @hash["lueventdate"] = date
    end  

    def lookup_event_date_end
        @hash["lueventdateend"]
    end  

    def lookup_event_date_end=(date)
        @hash["lueventdateend"] = date
    end     

    def lockfield?
        @hash["lockfield"] == BigDecimal.new(1)
    end

    def lockfield(lockfield)
         @hash["lockfield"] = BigDecimal.new(lockfield)
    end
end