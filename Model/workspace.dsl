workspace "Examination System" "" {
    model {
        S = softwareSystem "Examination System" "Allows users to view and manage exam terms and results and enroll into exam terms. Also provides statistics to managers." {
            term_manager = container "Exam Terms Manager" "Manages exam terms."{
                group "API Layer" {
                    term_interface = component "Exam Terms Interface" "Translates API requests to business logic calls."
                }
                group "Business Layer" {
                    term_controller = component "Exam Terms Controller" "Encapsulates exam term management business logic."
                    term_scheduler = component "Exam Scheduler" "Handles scheduling of exam terms and coordinates with the Schedules System."
                    term_notifier = component "Notification Coordinator" "Requests notifications to be sent for exam term updates."
                }
                group "Persistence Layer" {
                    term_repo = component "Exam Terms Repository" "Provides access to the underlying exam terms database."
                }
            }
            
            result_manager = container "Result Manager" "Manages course credits and exam results." {

                group "API Layer" {
                    result_interface = component "Result Interface" "Translates API requests to business logic calls for result management."
                }

                group "Business Layer" {
                    result_processor = component "Result Processor" "Processes and updates exam results."
                    result_retriever = component "Result Retriever" "Handles retrieval of exam results for display."
                    result_notifier = component "Notification Coordinator" "Requests notifications for result updates."
                }

                group "Persistence Layer" {
                    result_repo = component "Result Repository" "Provides access to the underlying exam results database."
                }
            }

            stats_manager = container "Exam Statistics Manager" "Manages result statistics." {
                group "API Layer" {
                    stats_interface = component "Statistics Interface" "Translates API requests to bussiness logic calls."
                }
                group "Business Layer" {
                    stats_controller = component "Statistics" "Encapsulates statistics info business logic."
                }
                group "Persistence Layer" {
                    stats_repo = component "Statistics Repository" "Provides access to the underlying statistics database."
                }
            }

            aggregator = container "Result Aggregator" "Aggregates past results into statistics." "CLI Application" {
                group "Presentation" {
                    aggregator_manager = component "Task Manager" "Command line interface. Starts the task and provides the parameters of the task."
                }
                group "Pipeline" {
                    aggregator_producer = component "Result Reader" "Reads historic results for the task and creates a stream."
                    aggregator_transformer = component "Aggregator" "Aggregates results into statistics based on the settings."
                    aggregator_consumer = component "Statistics Writer" "Writes statistics into the statistics database."
                }
            }

            term_database = container "Exam Terms Database" "" "" "Database"
            results_database = container "Exam Results Database" "" "" "Database"
            stats_database = container "Exam Statistics Database" "" "" "Database"

            exams_web_app = container "Exam Web App" "Displays data to the users and allows them to send requests." "" "Web Front-End"


            selenium_test = container "Selenium Tests" "Navigation flow & UI Elements"
            junit_test = container "JUnit Tests" "Unit tests"
            apache_jmeter_test = container "Apache Jmeter Tests" "Load Testing"
            toad_oracle = container "Toad For Oracle" "Functional testing for database"
            oracle_enterprise_manager = container "Oracle Enterprise Manager" "Performance testing"
            oracle_sql_developer = container "Oracle SQL Developer" "Security Testing"
            oracle_rman = container "Oracle Rman" "Backup Testing"
        }

        system_schedules = softwareSystem "Schedules System" "Allows users to view and manage schedules." "Existing System"
        system_enrollment = softwareSystem "Enrollment System" "Allows users to manage courses and enroll into courses." "Existing System"
        system_notifications = softwareSystem "Notification System" "Sends notifications to users." "Existing System"
        system_auth = softwareSystem "Auth" "Provides Authentication and Authorisation." "Existing System"

        stats_interface -> system_auth "Assures user authenticity"
        stats_interface -> stats_controller "Translates user requests"
        stats_controller -> stats_repo "Provides statistical data"
        stats_repo -> stats_database "Accesses statistical data"

        exams_web_app -> term_manager "Requests information and changes about exam terms"
        exams_web_app -> result_manager "Requests information and changes about exam results"
        exams_web_app -> stats_interface "Requests statistics about exam results"
        exams_web_app -> term_interface "Requests information and interactive possibilities"
        exams_web_app -> system_auth "Delegates authentication and authorisation"
        exams_web_app -> result_interface "Requests and modifies exam results"

        term_manager -> term_database "Reads and writes exam terms"
        term_manager -> system_schedules "Asks for room reservations"
        term_manager -> system_enrollment "Reads which students are enrolled into which courses"
        term_manager -> system_notifications "Requests to send notifications"
        term_manager -> system_auth "Delegates authentication and authorisation"

        result_manager -> results_database "Reads and writes exam results"
        result_manager -> system_enrollment "Reads which students are enrolled into which courses"
        result_manager -> system_notifications "Requests to send notifications"
        result_manager -> system_auth "Delegates authentication and authorisation"

        aggregator_manager -> aggregator_producer "Starts task with selected parameters"
        aggregator_producer -> results_database "Reads historic results"
        aggregator_transformer -> aggregator_manager "Reads aggregation rules"
        aggregator_consumer -> stats_database "Writes aggregated statistics"
        aggregator_producer -> aggregator_transformer "Passes data"
        aggregator_transformer -> aggregator_consumer "Passes data"

        result_interface -> result_processor "Translates API requests for result processing"
        result_interface -> result_retriever "Translates API requests for result retrieval"
        result_processor -> result_repo "Writes results to the database"
        result_retriever -> result_repo "Reads results from the database"
        result_repo -> results_database "Accesses exam result data"
        result_processor -> result_notifier "Requests notifications for result updates"
        result_notifier -> system_notifications "Sends notifications about term updates"
        result_interface -> system_auth "Assures user authenticity"


        manager = person "Manager"
        student = person "Student"
        teacher = person "Teacher"

        manager -> exams_web_app "Reads about teacher performance"
        student -> exams_web_app "Registers to exam terms and views exam results"
        teacher -> exams_web_app "Makes exam terms and sets exam results"
        manager -> aggregator_manager "Runs tasks"

        # Exam term manager
        term_interface -> term_controller "Translates user requests for term management"
        term_interface -> system_enrollment "Reads which students are enrolled in which courses. "
        term_interface -> system_enrollment "Reads which teacher teaches which courses."
        term_controller -> term_repo "Reads and writes term data"
        term_repo -> term_database "Accesses exam term data"
        term_controller -> term_scheduler "Coordinates for room reservations"
        term_scheduler -> system_schedules "Asks for room reservations"
        term_controller -> term_notifier "Requests notifications"
        term_notifier -> system_notifications "Sends notifications about term updates"
        term_interface -> system_auth "Assures user authenticity"
        term_controller -> result_manager "Queries about required credits"

        term_controller -> result_interface "Queries for required credits"

        # Testing relations
        exams_web_app -> selenium_test "Tests UI"
        exams_web_app -> apache_jmeter_test "Load testing"

        term_manager -> junit_test "Unit tests for Java"
        result_manager -> junit_test "Unit tests for Java"
        stats_manager -> junit_test "Unit tests for Java"
        aggregator -> junit_test "Unit tests for Java"

        term_database -> oracle_enterprise_manager "Performance testing"
        stats_database -> oracle_enterprise_manager "Performance testing"
        results_database -> oracle_enterprise_manager "Performance testing"

        term_database -> oracle_sql_developer "Security testing"
        stats_database -> oracle_sql_developer "Security testing"
        results_database -> oracle_sql_developer "Security testing"

        term_database -> oracle_rman "Backup testing"
        stats_database -> oracle_rman "Backup testing"
        results_database -> oracle_rman "Backup testing"

        term_database -> toad_oracle "functional testing"
        stats_database -> toad_oracle "functional testing"
        results_database -> toad_oracle "functional testing"

        deploymentEnvironment "Live"    {
            deploymentNode "User's web browser" "" ""    {
                user_html_instance = containerInstance exams_web_app
            }
            deploymentNode "Application Server" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Web server" "" "Apache Tomcat 10.1.15"  {
                    term_app_instance = containerInstance term_manager
                    result_app_instance = containerInstance result_manager
                    stats_app_instance = containerInstance stats_manager
                }
            }
            deploymentNode "Agregator Server" "" "Ubuntu 18.04 LTS"{
                aggregator_app_instance = containerInstance aggregator
            }
            deploymentNode "Database Server" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Relational DB server" "" "Oracle 19.1.0" {
                    term_db_instance = containerInstance term_database
                    stats_db_instance = containerInstance stats_database
                    results_db_instance = containerInstance results_database
                }

            }
        }

        deploymentEnvironment "Tests"    {
            deploymentNode "User's web browser" "" ""    {
                test_user_html_instance = containerInstance exams_web_app
                deploymentNode "Nav. Flow & UI Elements Tests" "" "Selenium WebDriver"{
                    selenium_test_instance = containerInstance selenium_test
                    apache_jmeter_test_instance = containerInstance apache_jmeter_test
                }
            }
            deploymentNode "Application Server" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Web server" "" "Apache Tomcat 10.1.15"  {
                    test_term_app_instance = containerInstance term_manager
                    test_result_app_instance = containerInstance result_manager
                    test_stats_app_instance = containerInstance stats_manager
                    deploymentNode "Unit tests" "JUnit" {
                        webserver_junit_test_instance = containerInstance junit_test
                    }
                }
            }
            deploymentNode "Agregator Server" "" "Ubuntu 18.04 LTS"{
                test_aggregator_app_instance = containerInstance aggregator
            }
            deploymentNode "Database Server" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Relational DB server" "" "Oracle 19.1.0" {
                    test_term_db_instance = containerInstance term_database
                    test_stats_db_instance = containerInstance stats_database
                    test_results_db_instance = containerInstance results_database
                }
                deploymentNode "Database Tests" "Oracle & Toad" {
                        oem_test_instance = containerInstance oracle_enterprise_manager
                        osd_test_instance = containerInstance oracle_sql_developer
                        orm_test_instance = containerInstance oracle_rman
                        toad_test_instance = containerInstance toad_oracle
                    }

            }
        }

    }

    views {
        systemContext S "C1" {
            include *
            autolayout tb
        }

        container S "C2" {
            include *
            exclude "selenium_test"
            exclude "junit_test"
            exclude "apache_jmeter_test"
            exclude "toad_oracle"
            exclude "oracle_enterprise_manager"
            exclude "oracle_sql_developer"
            exclude "oracle_rman"
        }

        component stats_manager "C3_statistics" {
            include *
        }

        component aggregator "C3_Aggregator" {
            include *
        }

        component term_manager "C3_ExamTermManager"{
            include *
        }

        component result_manager "C3_ResultManager" {
            include *
        }

        dynamic stats_manager {
            title "Viewing statistics"
            exams_web_app -> system_auth "User authenticates"
            exams_web_app -> stats_interface "App requests statistics for given querry"
            stats_interface -> system_auth "Assures the user is authanticated and has the rights"
            stats_interface -> stats_controller "Translates and forwards request"
            stats_controller -> stats_repo "Requests data for the querry"
            stats_repo -> stats_database "Access the data in the database"
            stats_database -> stats_repo "Returns the data"
            stats_repo -> stats_controller "Returns the data"
            stats_controller -> stats_interface "Transforms the data"
            stats_interface -> exams_web_app "Serializes and sends the data"
        }

        dynamic term_manager {
            title "Enrolling into an exam term"
            exams_web_app -> system_auth "User authenticates"
            exams_web_app -> term_interface "Request enrollment"
            term_interface -> system_auth "Assures the user is authanticated and has the rights"
            term_interface -> term_controller "Translates and forwards request"
            term_controller -> term_repo "Requests exam term data"
            term_repo -> term_database "Access the data in the database"
            term_database -> term_repo "Returns the term data"
            term_repo -> term_controller "Returns the term data"
            term_controller -> result_interface "Queries for required credits"
            result_interface -> term_controller "Returns the credits data"
            term_controller -> term_repo "Writes enrollment"
            term_repo -> term_database "Writes enrollment"
            term_database -> term_repo "Sends confirmation"
            term_repo -> term_controller "Sends confirmation"
            term_controller -> term_interface "Sends result"
            term_interface -> exams_web_app "Serializes and sends the result"
            term_controller -> term_notifier "Requests notification"
            term_notifier -> system_notifications "Sends notification"
        }

        dynamic term_manager {
            title "Creating an exam term"
            exams_web_app -> system_auth "User authenticates"
            exams_web_app -> term_interface "Request exam module"
            term_interface -> system_auth "Assures the user is authanticated and has the rights"
            term_interface -> system_enrollment "Get teachers courses"
            term_interface -> exams_web_app "Show all possible cources to the teacher"
            exams_web_app -> term_interface "Write all information abot the exam"
            term_interface -> term_controller "Translates and forwards request"
            term_controller -> term_repo "Requests exams data"
            term_repo -> term_database "Access the data in the database"
            term_database -> term_repo "Returns the exams data"
            term_repo -> term_controller "Returns the subjects data"
            term_controller -> term_scheduler "Pass data"
            term_scheduler -> system_schedules "Check all information"
            term_scheduler -> term_controller "Return result"
            term_controller -> term_repo "Writes exam"
            term_repo -> term_database "Writes data"
            term_database -> term_repo "Sends confirmation"
            term_repo -> term_controller "Sends confirmation"
            term_controller -> term_interface "Sends result"
            term_interface -> exams_web_app "Serializes and sends the result"
            term_controller -> term_notifier "Requests notification"
            term_notifier -> system_notifications "Sends notification"
        }

        dynamic result_manager {
            title "Viewing exam results"
            exams_web_app -> system_auth "User authenticates"
            exams_web_app -> result_interface "Requests exam results"
            result_interface -> system_auth "Assures the user is authanticated and has the rights"
            result_interface -> result_retriever "Translates the API request"
            result_retriever -> result_repo "Requests the exam result data"
            result_repo -> results_database "Queries the Exam DB"
            results_database -> result_repo  "Retrieves the data from Exam DB"
            result_repo -> result_retriever "Forwards the data"
            result_retriever -> result_interface "Resolves the API request"
            result_interface -> exams_web_app "Serializes and sends results"


        }

        dynamic result_manager {
            title "Updating exam results"
            exams_web_app -> system_auth "User authenticates"
            exams_web_app -> result_interface "Requests exam results"
            result_interface -> system_auth "Assures the user is authanticated and has the rights"
            result_interface -> result_processor "Translates the API request"
            result_processor -> result_repo "Requests the modification of exam result"
            result_repo -> results_database "Modifies the exam results"
            result_repo -> result_processor "HTTP 200 OK"
            result_processor -> result_notifier "Requests notification that exam result have beeen changed"
            result_notifier -> system_notifications "Sends the notification"
            result_processor -> result_interface "Confirms the transaction"
            result_interface -> exams_web_app "Confirms the transaction to the user"



        }

        dynamic result_manager {
            title "Granting course credits"
            exams_web_app -> system_auth "User authenticates"
            exams_web_app -> result_interface "Requests teacher's subjects"
            result_interface -> system_auth "Assures the user is authenticated and has the rights"
            result_interface -> result_retriever "Retrieves the list of teacher's subjects and students"
            result_retriever -> result_repo "Queries data for teacher's subjects and students"
            result_repo -> results_database "Accesses subjects and students data"
            results_database -> result_repo "Returns subjects and students data"
            result_repo -> result_retriever "Returns subjects and students data"
            result_retriever -> result_interface "Resolves data retrieval"
            result_interface -> exams_web_app "Displays the list of subjects and students"
            exams_web_app -> result_interface "Requests to grant credit to selected students"
            result_interface -> result_processor "Processes the credit granting request"
            result_processor -> result_repo "Requests the update of credit status"
            result_repo -> results_database "Modifies the credit data"
            results_database -> result_repo "Confirms the modification"
            result_repo -> result_processor "Returns update confirmation"
            result_processor -> result_notifier "Requests notification about credit status update"
            result_notifier -> system_notifications "Sends notification to affected students"
            result_processor -> result_interface "Confirms the update"
            result_interface -> exams_web_app "Displays confirmation to the teacher"
            
        }

        deployment S "Live" "Live_Deployment"   {
            include *
        }

        deployment S "Tests" "Development_Deployment"   {
            include *
            exclude "exams_web_app -> term_manager"
            exclude "exams_web_app -> result_manager"
            exclude "exams_web_app -> stats_manager"

            exclude "term_manager -> term_database"
            exclude "result_manager -> results_database"
            exclude "stats_manager -> stats_database"

            exclude "aggregator -> stats_database"

            exclude "aggregator -> results_database"
            exclude "term_manager -> result_manager"

        }

        theme default

        styles {
            element "Existing System" {
                background #999999
                color #ffffff
            }

            element "Web Front-End"  {
                shape WebBrowser
            }

            element "Database"  {
                shape Cylinder
            }
        }
    }
}
