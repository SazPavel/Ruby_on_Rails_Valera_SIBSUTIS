# README

[![Build Status](https://travis-ci.org/SazPavel/Ruby_on_Rails_Valera_SIBSUTIS.svg?branch=master)](https://travis-ci.org/SazPavel/Ruby_on_Rails_Valera_SIBSUTIS)
## Описание
Это - командный проект по предмету "оптимизация ПО".  
Реализует мини-игру про "маргинала Валеру".  
Написан преимущественно на языке Ruby с использованием фреймворка Ruby on Rails.

Суть игры такова:  
есть некое существо по имени Валера, у него есть параметры:  
здоровье, мана (алкоголь в крови), веселье, усталость, деньги.

Валера может выполнять некоторые действия:  
например, поспать или выпить.

Каждое действие выполняется при определенных условиях  
(усталый Валера не пойдет на работу) и изменяет определенные параметры  
(сон увеличивает здоровье, а пьянство его уменьшает и повышает ману).  

## Зависимости
У Валеры - алкогольная %)  
У проекта - указаны в Gemfile.  

Для запуска обязательно иметь ruby и bundler.  
Версия ruby в проекте - 2.5.1, версия rails - 5.2.3

Для работы с базами данных (создание пользователей) использовалась PostgreSQL.

Со старыми версиями некоторых модулей (например, rails или json)  
могут возникнуть конфликты.  
Можно попробовать вылечить переустановкой конфликтующих модулей.  

## Запуск
Если все нужные зависимости проекта установлены,  
выполнить 'rails server' из корневой директории проекта.  

Если сервер запустился без ошибок - по умолчанию  
игра запустится на странице по адресу localhost:3000  

Если с ошибками - см. "Зависимости".
