<?php

    // fuzu buzz Game
    // x % 3 = 0  fuzu!
    // x % 5 = 0  buzu!
    // x % [3 and 5] = 0  fuzu!buzu!!
    // other = Numbers

    // Magic number measures
    define('INT_FUZU_NUM',    3);
    define('INT_BUZZ_NUM',    5);

    if (empty($argv[1]) || !intval($argv[1])) {
        echo "Do not Number\n";
        exit;
    }

    $iTargetNumber = $argv[1];

    for ($i = 1; $i <= $iTargetNumber; $i++) {
        if (($i % INT_FUZU_NUM == 0) && 
            ($i % INT_BUZZ_NUM == 0)) {
            echo "fuzu!buzz!!\n";
        } else if ($i % INT_FUZU_NUM == 0) {
            echo "fuzu!\n";
        } else if ($i % INT_BUZZ_NUM == 0) {
            echo "buzz!\n";
        } else {
            echo $i . "\n";
        }
    }
