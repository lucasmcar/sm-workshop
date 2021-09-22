<?php

require '../../vendor/autoload.php';

use Workshop\SmWorkshop\Config\CustomHash;

$senha = "123456";

$hashed = CustomHash::encodePass($senha);

echo " senha ${hashed} <br>";

$dehashed = CustomHash::decodePass($senha);

echo " dehashd ${dehashed}";

