<?php

namespace Workshop\SmWorkshop\Config;

class CustomHash
{
    /**
     * Método que valida e faz o hash da senha
     * @param $key
     * @return false|string|void|null
     */

    public static function encodePass($key)
    {
        if(!empty($key) && strlen($key) >= 6) {
            return password_hash($key, PASSWORD_DEFAULT);
        }

    }

    /**
     * Método que verifica se o hash da senha é valido
     * @param $key
     * @return bool
     */
    public static function decodePass($key)
    {
        if(password_verify($key, self::encodePass($key))){
            return true;
        }

        return false;
    }
}