var express = require('express');
var router = express.Router();
var connection = require('../db/connection');

router.get('/all_courses', function(req, res, next) {

    // Show all Courses
    var courses = connection.query(`SELECT * FROM cousres_list`);
    res.send(courses);
});

router.get('/select_courses/:id', function(req, res, next) {
    
    var user_id = 1; // req.cookies.userID
    var course = connection.query(`SELECT * FROM cousres_list WHERE cousre_list_id = '${req.params.id}' AND number_of_students > used `);
    if( course.length == 1 ){

        var user_elective_courses = connection.query(`SELECT * FROM selected_courses WHERE user_id = ${user_id}`);

        if( user_elective_courses.length < 1){
            var new_selected_course = connection.query(`INSERT INTO selected_courses (user_id, course_list_id, date) VALUES (${user_id}, ${req.params.id},"111" )`);
            res.send("inserted")
        }else{
            
            arr_user_elective_course = [];
            user_elective_courses.forEach( elective_course => {
                arr_user_elective_course.push( elective_course.course_list_id );
            });

            var choosed_course = connection.query(`SELECT * FROM cousres_list WHERE cousre_list_id = '${req.params.id}'`)[0];
            var start_class = parseInt(choosed_course.class_start_time);
            var class_duration = parseFloat(choosed_course.class_duration);
            var finish_class = start_class + (class_duration * 3600 * 1000)  

            // res.send( { start_class:new Date(start_class).getHours(), finish_class: new Date(finish_class).getHours() });

            // Check subject name and time
            var error = false;
            var error_arr = []

            arr_user_elective_course.forEach( row => {
                var result = connection.query(`SELECT * FROM cousres_list WHERE cousre_list_id = '${row}'`) [0];

                var pre_start_class = parseInt(result.class_start_time); 
                var pre_class_duration = parseFloat(result.class_duration);
                var pre_finish_class = start_class + (pre_class_duration * 3600 * 1000)   
     
                if( result.course === choosed_course.course ){
                    error_arr.push({result: true, msg: 'course is duplicate'})
                }else{

                    if( new Date(start_class).getDay() == new Date(pre_start_class).getDay() ){

                        if( (pre_start_class <= start_class && start_class <= pre_finish_class) || (pre_start_class <= finish_class && finish_class <= pre_finish_class) ){

                            error_arr.push({result: true, msg: 'tadakhol zamani',pre_finish_class:pre_finish_class, pre_start_class:pre_start_class, start_class:start_class, finish_class:finish_class})
                        }else{
                            error_arr.push({result: false})
                        }

                    }else{
                        error_arr.push({result: false})
                    }
                    
                }
            });

            res.send(error_arr)

        }                            
        // var new_selected_course = connection.query(`INSERT INTO selected_courses (user_id, course_list_id, date) VALUES (${user_id}, ${req.params.id},"111" )`);

    }else{
        res.send({ result: false, msg: 'Class capacity is complete.'})
    }
    
});


  
module.exports = router;