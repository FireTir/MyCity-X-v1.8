@echo off
:boot
title MyCity v1.8
color 0A

:start
cls
echo #################################                            
echo #### Witaj w grze MyCity! ######
echo #################################           
echo ________________
echo 1. Zacznij gre
echo 2. Instrukcja
echo 3. Informacje o grze
echo 4. Lista zmian
echo 5. Instrukcja lotto
echo 6. Wyjscie z gry
set /p wybieram:={1;2;3;4;5;6}:  
if %wybieram:%==1 goto gra
if %wybieram:%==2 goto instrukcja
if %wybieram:%==3 goto info
if %wybieram:%==4 goto poprawkibenka
if %wybieram:%==5 goto lotto2
if %wybieram:%==6 goto exit  

:lotto2
cls
echo.
echo -Jedno losowanie kosztuje 60 dolarow
echo -Mozesz wylosowac liczby od 1 do 99
echo -Jak wylosujesz np. 10
echo  1000-60=940    940+10=950 + podatek 30 = 990
echo  czyli jestes na minusie
echo -Jak wylosujesz np. 50
echo  1000-60=940    940+50=990 + podatek 30 = 1020
echo  czyli jestes na plusie
pause>nul
cls
goto start

:poprawkibenka
cls
echo  Wersja v1.5                                      
echo - Pierwsza Wersja
echo Nacisni byle jaki przycisk by kontynuowac przegladanie listy zmian
pause>nul
echo Wersja v1.8
echo - Przy rozpoczeciu gry zostala dodana Gazeta
echo - Dodanie opcji w menu o instrukcji lotto
echo - Zostala dodana opcja sprzedazy firmom dzialek
echo   za pieniadze kosztem pkt. ubywania
echo - Liczba ubywanych mieszkancow zostala podniesiona
echo   z 15 do 30
echo - pomniejsze poprawki co do ubywania
pause>nul
cls
goto start


:exit
exit

:info
cls
echo.
echo Gra zostala stworzona przez FireTIRa,
echo.
echo Kanal na YouTube tworcy gry (FireTIRa) to _FireTir_ 

echo Wcisnij dowolny klawisz, aby powrocic do menu.
pause>nul
cls
goto start

:instrukcja
cls
echo Jestes burmistrzem, posiadasz wlasne miasto i twoim zadaniem jest dbac
echo  o nie i rozbudowywywac je.
echo. 
ping localhost-n 2 >nul
echo Posiadasz wlasna gotowke, ktora mozesz przeznaczyc na rozbudowe, badz
echo budowe budynkow.
echo.
ping localhost-n 2 >nul
echo. Spraw, aby twoi mieszkancy byli zadowoleni z twojej sluzby!
ping localhost-n 2 >nul
echo Wcisnij dowolny klawisz, aby powrocic do menu.
pause>nul
cls
goto start


:gra
cls
set kasa=1000
set mieszkancy=50
set dom=200
set wiezowiec=400
set altana=120
set mw=80
set md=40
set ma=20
set mu=0
set start=0
cls
echo Skonfiguruj burmistrza
echo Imie:
set/p "imie=>> "
cls
echo Nazwisko:
set/p "nazwisko=>> "
echo.
cls
echo Zdecyduj, jak ma sie nazywac twoje miasto.
set/p "miasto=>> "
cls
echo No,no %imie% , mysle ze %miasto% fajnie brzmi.
ping localhost-n 1 >nul
echo Na start otrzymujesz 1000 dolarow bonusu.
ping localhost-n 1 >nul
echo Wcisnij dowolny przycisk, aby rozpoczac gre.
pause >nul
goto gazeta

:gazeta
cls
echo #####@ POLGAZETA @######
echo     ### Newsy: #####
echo W wojewodztwie Podzarskim powstalo nowe miasto o nazwie %miasto% !
echo Aktualnie jest zameldowanych tam ponad %mieszkancy% mieszkancow.
echo Burmistrzem zostal Sz.P %imie% %nazwisko% GRATULUJEMY!
ping localhost-n 1 >nul
echo Wcisnij dowolny przycisk, aby rozpoczac gre.
pause >nul
goto wyborgra

:wyborgra
cls
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time% Menadzer to: %menadzer%
echo --------------------------------------------------------------------------------
:blank
echo Twoje pole jest puste! Mieszkancy nie maja gdzie mieszkac. Wybuduj im mieszkania!
ping localhost-n 1 >nul
echo.
echo.
echo 1. Wybuduj dom (200 dolarow)
echo 2. Wybuduj wiezowiec (400 dolarow)
echo 3. Wybuduj altane (120 dolarow)
echo 4. Wybuduj lotnisko (30,000 dolarow)
echo 5. Wybuduj sklep (100 dolarow)
echo 6. Lotto (60 dolarow)
echo 7. Sprzedaj dzialki firmom 
echo 8. Nic
set /p wybieram:={1;2;3;4;5;6;7}:  
if %wybieram:%==1 goto dom1
if %wybieram:%==2 goto wiezowiec1
if %wybieram:%==3 goto altana1
if %wybieram:%==4 goto lotnisko
if %wybieram:%==5 goto sklep
if %wybieram:%==6 goto lotto
if %wybieram:%==7 goto sprzedaz
if %wybieram:%==8 goto nic
echo Zly wybor!
goto wyborgra 


:wiezowiec1
cls
set /a kasa=kasa-wiezowiec
set /a mieszkancy=mw+mieszkancy
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time%
echo --------------------------------------------------------------------------------
echo ##############
echo #            #
echo #            #
echo #            #
echo # WIEZOWIEC  #
echo #            #
echo #            #
echo #            #
echo ##############
echo.
echo.
echo.
echo --------------------------------------------------------------
echo Twoi mieszkancy sa zadowoleni, ze wybudowales im wiezowiec!
pause
if %kasa% LEQ 0 goto koniec
if %mieszkancy% LEQ 0 goto koniec1
if %start%== 1 goto podatek
goto cz1

:dom1
cls
set /a kasa=kasa-dom
set /a mieszkancy=md+mieszkancy
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time%
echo --------------------------------------------------------------------------------
echo    ########
echo   ##      ##
echo  ### DOM  ###
echo    #      #
echo    #      #
echo    #      #
echo    ########
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------------------------------------
echo Twoi mieszkancy sa zadowoleni, ze wybudowales im dom!
pause
if %kasa% LEQ 0 goto koniec
if %mieszkancy% LEQ 0 goto koniec1
if %start%== 1 goto podatek
goto cz1

:altana1
cls
set /a kasa=kasa-altana
set /a mieszkancy=ma+mieszkancy
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time% Menadzer to: %menadzer%
echo --------------------------------------------------------------------------------
echo ########
echo #A
echo # L 
echo #  T     
echo #   A    
echo #    N    
echo #     A
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------------------------------------
echo Twoi mieszkancy sa zadowoleni, ze wybudowales im altane!
pause
if %start%== 1 goto podatek
if %mieszkancy% LEQ 0 goto koniec1
if %kasa% LEQ 0 goto koniec
goto cz1
:lotnisko
cls
set /a kasa=kasa-30000
set /a mieszkancy=3500+mieszkancy
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time%
echo --------------------------------------------------------------------------------
echo ##############
echo #            #
echo #            #     #
echo #            #  #   #
echo # LOTNISKO   #   ########
echo #            #        #
echo #            #         #
echo #            #
echo ##############-----------------
echo. -   -    -   -   -   -   -   -
echo.-------------------------------
echo.
echo --------------------------------------------------------------
echo Twoi mieszkancy sa zadowoleni, ze wybudowales im lotnisko!
pause
if %start%== 1 goto podatek
if %mieszkancy% LEQ 0 goto koniec1
if %kasa% LEQ 0 goto koniec
goto cz1

:sklep
cls
set /a kasa=kasa-100
set /a mieszkancy=40+mieszkancy
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time%
echo --------------------------------------------------------------------------------
echo ##########
echo #        #
echo # SKLEP  #    --------
echo #        #    Promocje
echo #        #    --------    
echo #        #       #
echo ##########       #
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------------------------------------
echo Twoi mieszkancy sa zadowoleni, ze wybudowales im sklep!
pause
if %start%== 1 goto podatek
if %kasa% LEQ 0 goto koniec
if %mieszkancy% LEQ 0 goto koniec1
goto cz1

:cz1
cls
echo #####@ POLGAZETA @######
echo     ### Newsy: #####
echo W wojewodztwie Podzarskim zsotaje rozbudowane miasto o nazwie %miasto% !
echo Aktualnie jest zameldowanych tam ponad %mieszkancy% mieszkancow.
echo Burmistrzem jest Sz.P %imie% %nazwisko% GRATULUJEMY!
pause
cls
goto podatek
:nic
cls
echo Nic nie wybudowales :(
set /a mu=mu+1
if %mu%== 10 goto ubywanie
if %mu% GEQ 10 goto ubywanie
echo Twoj licznik ubywania wynosi %mu%. Jezeli dojdzie do 10,
echo ubedzie Ci 30 mieszkancow
pause
goto podatek

:ubywanie
echo Niestety ubylo 30 mieszkancow!
if %mieszkancy% LEQ 0 goto koniec1
set /a mieszkancy=mieszkancy-30
set /a mu=0
pause

:podatek
cls
if %mieszkancy% LEQ 0 goto koniec1
set /a kasa=kasa+30
echo Podatek od twoich mieszkancow wynosi 30 dolarow
pause
cls
goto wyborgra1

:koniec
cls
echo #####@ POLGAZETA @######
echo     ### Newsy: #####
echo Miasto %miasto% zbankrutowalo z zadluzeniem %kasa% dolarow!
echo Mialo %mieszkancy% mieszkancow, a byly burmistrz
echo to %imie% %nazwisko%. Jutro odbedzie sie
echo przewoz mieszkancow do Sochaczewa autokarem.
echo -----------------------------
echo KONIEC GRY!
echo -----------------------------
pause
goto boot

:koniec1
cls
echo #####@ POLGAZETA @######
echo     ### Newsy: #####
echo Z miasta %miasto% wyjechali mieszkancy!
echo Miasto zostaje 'miastem widmo', a byly burmistrz
echo to %imie% %nazwisko%. Jutro odbedzie sie
echo odsprzedanie terenu miasta na rzecz miasta Trolowo
echo ktore chce tam powstaæ
echo Odmówiles Odsprzedaniu Terenu miasta 
echo do twojego miasta przyjechalo 200 ludzi
echo  @@@@@#REKLAMA @#######
echo                       TELEWIZJA
echo miasto nie zosta³o odsprzedane i nie jest miastem widmo 
echo   Burmistrz Maciej Urbañski mia³ szpiega który pracowa³ w twojej firmie
echo   wy³udza³ wszystkie informacje
echo Zbankrutowa³es nie masz pieniêdzy 
echo -----------------------------
echo KONIEC GRY!
echo -----------------------------
pause
goto boot


:wyborgra1
cls
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time% Menadzer to: %menadzer%
echo --------------------------------------------------------------------------------
:blank
echo Twoje pole jest puste! Wybuduj cos!
ping localhost-n 1 >nul
echo.
echo.
echo 1. Wybuduj dom (200 dolarow)
echo 2. Wybuduj wiezowiec (400 dolarow)
echo 3. Wybuduj altane (120 dolarow)
echo 4. Wybuduj lotnisko (30,000 dolarow)
echo 5. Wybuduj sklep (100 dolarow)
echo 6. Lotto (60 dolarow)
echo 7. Sprzedaj dzialki firmom 
echo 8. Nic
set /p wybieram:={1;2;3;4;5;6;7}:  
if %wybieram:%==1 goto dom1
if %wybieram:%==2 goto wiezowiec1
if %wybieram:%==3 goto altana1
if %wybieram:%==4 goto lotnisko
if %wybieram:%==5 goto sklep
if %wybieram:%==6 goto lotto
if %wybieram:%==7 goto sprzedaz
if %wybieram:%==8 goto nic
if %mieszkancy% LEQ 0 goto koniec1
echo Zly wybor!
goto wyborgra1 

:lotto
set /a kasa=kasa-60
set liczba1=%random:~0,2%
IF %liczba1%==0 goto 1
IF %liczba1% GEQ 98 goto lotto
IF %liczba1% LEQ 99 goto 2
:2
set /a kasa=kasa+%liczba1%
echo Szczesliwa wylosowana liczba to: %liczba1%
echo.
echo.
pause > nul
goto podatek

:sprzedaz
cls
echo #######################################################################
echo ### Informacje: %kasa% dolarow ### Mieszkancy: %mieszkancy% #######################
echo #######################################################################
echo --------------------------------------------------------------------------------
echo Godzina w miescie %miasto% wynosi %time% Menadzer to: %menadzer%
echo --------------------------------------------------------------------------------
:blank
echo Mozesz sprzedac dzialki firmom za pieniadze kosztem ubywania
ping localhost-n 1 >nul
echo.
echo.
echo 1. Sprzedaj mala dzialke (zysk 100 dolarow kosztem 2 pkt. ubywania)
echo 2. Sprzedaj srednia dzialke (zysk 250 dolarow kosztem 3 pkt. ubywania) 
echo 3. Sprzedaj duza dzialke (zysk 320 dolarow kosztem 5 pkt. ubywania)
echo 4. Wroc do panelu zarzadzania
set /p wybieram:={1;2;3;4}:  
if %wybieram:%==1 goto dzialka1
if %wybieram:%==2 goto dzialka2
if %wybieram:%==3 goto dzialka3
if %wybieram:%==4 goto wyborgra1
echo Zly wybor!
goto sprzedaz

:dzialka1
cls
set /a kasa=kasa+100
set /a mu=mu+2
if %mu%== 10 goto ubywanie
if %mu% GEQ 10 goto ubywanie
echo Sprzedales mala dzialke!
echo Dostajesz 100 dolarow.
echo.
echo Twoj licznik ubywania wynosi %mu%. Jezeli dojdzie do 10,
echo ubedzie Ci 30 mieszkancow
pause
goto podatek

:dzialka2
cls
set /a kasa=kasa+250
set /a mu=mu+2
if %mu%== 10 goto ubywanie
if %mu% GEQ 10 goto ubywanie
echo Sprzedales srednia dzialke!
echo Dostajesz 250 dolarow.
echo.
echo Twoj licznik ubywania wynosi %mu%. Jezeli dojdzie do 10,
echo ubedzie Ci 30 mieszkancow
pause
goto podatek

:dzialka3
cls
set /a kasa=kasa+320
set /a mu=mu+5
if %mu%== 10 goto ubywanie
if %mu% GEQ 10 goto ubywanie
echo Sprzedales duza dzialke!
echo Dostajesz 320 dolarow.
echo.
echo Twoj licznik ubywania wynosi %mu%. Jezeli dojdzie do 10,
echo ubedzie Ci 30 mieszkancow
pause
goto podatek