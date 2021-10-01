<?php

namespace Workshop\SmWorkshop\Config;

class CustomHash
{

    private $key;

    private function __construct()
    {

    }

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
        return (password_verify($key, self::encodePass($key))) ? 1 : 0;
    }
}