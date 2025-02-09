{ config, lib, pkgs, ... }:

{
    i18n = (let
        enUS = "en_US.UTF-8/UTF-8";
        ruRU = "ru_RU.UTF-8/UTF-8";
        ukUA = "uk_UA.UTF-8/UTF-8";
    in {
        defaultLocale = "en_US.UTF-8";
        supportedLocales = [
            enUS
            ruRU
            ukUA
        ];
    });
}