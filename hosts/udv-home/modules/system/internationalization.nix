{ pkgs, lib, ... }:

{
    i18n = (let
        enUS = en_US.UTF-8/UTF-8;
        ruRU = ru_RU.UTF-8/UTF-8;
        ukUA = uk_UA.UTF-8/UTF-8;
    in {
        defaultLocale = enUS;
        supportedLocales = [
            enUS
            ruRU
            ukUA
        ];

        extraLocaleSettings = {
            LANGUAGE = "en_US:en";
            LC_ALL = "en_US.UTF-8";
        };
    });
}