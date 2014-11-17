require 'rfm'

class FilemakerClient < Rfm::Database

    def initialize(use_documents_database=false, with_logging=false)
        @with_logging = with_logging
        @server = use_documents_database ? server_with_documents_database : server_with_main_database
        super(database_name(use_documents_database), @server)
    end

    def create_blackout(fm_event_hash)
         _layout = self["SMG_Talent_WebApp: Talent Blackouts"]
         result = _layout.create(fm_event_hash)
         result.first.record_id
    end       

    def get_blackout(record_id)
        _layout = self["SMG_Talent_WebApp: Talent Blackouts"]
        result = _layout.find({"record_id" => record_id, "isblackout" => 1})
        result.empty? ? nil : result.first
    end    

    def delete_blackout(record_id)
         _layout = self["SMG_Talent_WebApp: Talent Blackouts"]
         result = _layout.delete(record_id)
    end   

    def test_connection
        begin
            fm_layout = self["SMG_Talent_WebApp: Talent Check"]  
            fm_layout.any
            return true
        rescue => e
            puts e
            return nil
        end
    end   

    private

        ACCOUNT_NAME = 'rubyfm'
        PASSWORD = 'P@sswerd'    

        def server_with_main_database
            # use host: 'cms.scratch.com' if app is moved to run in the cloud
            Rfm::Server.new(host: '10.10.10.16', account_name: ACCOUNT_NAME, password: PASSWORD, 
                            ssl: false, log_actions: @with_logging, log_responses: @with_logging)
        end

        def server_with_documents_database
            Rfm::Server.new(host: '54.225.109.76', account_name: ACCOUNT_NAME, password: PASSWORD, 
                            ssl: false, log_actions: @with_logging, log_responses: @with_logging)
        end

        def database_name(for_documents)
            if for_documents
                "ScratchEvents_Documents"
            else
                if Rails.env.production?
                    "ScratchEvents"
                else
                    "SMG_Development"
                end     
            end
        end
end