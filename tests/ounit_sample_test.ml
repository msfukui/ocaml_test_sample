open OUnit2

let say_hello_test = "echo string" >:: (fun _ -> assert_equal (Ounit_sample.say_hello "world") "Hello, world")

let tests = "all_tests" >::: [ say_hello_test; ]
