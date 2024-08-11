{ pkgs, lib, ... }:

{
    i18n = (let
        enUS = "en_US.UTF-8/UTF-8";
        ruRU = "ru_RU.UTF-8/UTF-8";
        ukUA = "uk_UA.UTF-8/UTF-8";
    in {
        defaultLocale = "en_US.UTF-8"; # Doesn't work with postfix for some reason
        supportedLocales = [
            enUS
            ruRU
            ukUA
        ];
    });
}