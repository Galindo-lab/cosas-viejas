<?php

class Tests {

    public $tests;
    public $status = true;
    public $action;

    function __construct($tests,$action) {
        $test_a = true;
        $this->tests = $tests;
        $this->action = $action;

        foreach($this->tests as $test_name=>$prueba){

            $test_a = $prueba();
            $this->status = $this->status && $test_a;

            //echo "$test_name : " . ($test_a ? "true" : "false") . "<br>";

            console_log("$test_name : " . ($test_a ? "true" : "false"));
        }

        //        echo ($this->status ? "all ok" : "not ok");


        if($this->status){
            $action();
        }
    }

}

?>
