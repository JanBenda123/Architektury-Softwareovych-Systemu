workspace "Examination System" "" {
    model {
        S = softwareSystem "Examination System" "Allows users to view and manage exam terms and results and enroll into exam terms. Also provides statistics to managers." {
            term_manager = container "Exam Terms Manager" "Manages exam terms."
            result_manager = container "Result Manager" "Manages course credits and exam results."
            aggregator = container "Result Aggregator" "Aggregates past results into statistics."
            stats_manager = container "Exam Statistics Manager" "Manages result statistics."
            
            term_database = container "Exam Terms Database" "" "" "Database"
            results_database = container "Exam Results Database" "" "" "Database"
            stats_database = container "Exam Statistics Database" "" "" "Database"

            exams_web_app = container "Exam Web App" "Displays data to the users and allows them to send requests." "" "Web Front-End"
        }

        system_schedules = softwareSystem "Schedules System" "Allows users to view and manage schedules." "Existing System"
        system_enrollment = softwareSystem "Enrollment System" "Allows users to manage courses and enroll into courses." "Existing System"
        system_notifications = softwareSystem "Notification System" "Sends notifications to users." "Existing System"
        system_auth = softwareSystem "Auth" "Provides Authentication and Authorisation." "Existing System"

        exams_web_app -> term_manager "Requests information and changes about exam terms"
        exams_web_app -> result_manager "Requests information and changes about exam results"
        exams_web_app -> stats_manager "Requests information about exam results"
        exams_web_app -> system_auth "Delegates authentication and authorisation"

        term_manager -> term_database "Reads and writes exam terms"
        term_manager -> system_schedules "Asks for room reservations"
        term_manager -> system_enrollment "Reads which students are enrolled into which courses"
        term_manager -> system_notifications "Requests to send notifications"
        term_manager -> system_auth "Delegates authentication and authorisation"

        result_manager -> results_database "Reads and writes exam results"
        result_manager -> system_enrollment "Reads which students are enrolled into which courses"
        result_manager -> system_notifications "Requests to send notifications"
        result_manager -> system_auth "Delegates authentication and authorisation"
        
        aggregator -> results_database "Reads historic results"
        aggregator -> stats_database "Writes aggregated statistics"

        stats_manager -> stats_database "Reads statistics"
        stats_manager -> system_auth "Delegates authentication and authorisation"

        manager = person "Manager"
        student = person "Student"
        teacher = person "Teacher"
        
        manager -> exams_web_app "Reads about teacher performance"
        student -> exams_web_app "Registers to exam terms and views exam results"
        teacher -> exams_web_app "Makes exam terms and sets exam results"
    }

    views {
        systemContext S "C1" {
            include *
            autolayout tb
        }

        container S "C2" {
            include *
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
