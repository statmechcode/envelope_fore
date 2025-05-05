rm -r temp
rm *.SAC
rm *.SAC.dat
rm fort.12
rm a.dat

#######INGV########

#curl --output prova.dat 'http://webservices.ingv.it/fdsnws/dataselect/1/query?net=CX&sta=PSGCX&cha=HHZ&starttime=2021-03-03T10:00:00&endtime=2021-03-06T09:59:59&nodata=404'

#######IRIS######

curl --output prova.dat 'http://service.iris.edu/fdsnws/dataselect/1/query?net=AK&sta=CHN&cha=BHZ&starttime=2021-07-29T06:00:00&endtime=2021-07-29T08:59:59&format=miniseed&nodata=404'

#curl --output prova.dat 'http://service.iris.edu/fdsnws/dataselect/1/query?net=PB&sta=B916&cha=EHZ&starttime=2019-07-06T03:00:00&endtime=2019-07-06T05:59:59&format=miniseed&nodata=404'

#####KOERI######

#curl --output prova.dat 'http://service.iris.edu/fdsnws/dataselect/1/query?network=KO&station=ARMT&cha=HHZ&starttime=2025-04-23T09:30:00&endtime=2025-04-23T10:30:00&format=miniseed&nodata=404'

#####GEOFON######

#curl --output prova.dat 'http://geofon.gfz-potsdam.de/fdsnws/dataselect/1/query?net=PZ&sta=BASD&cha=EHZ&starttime=2025-04-23T09:30:00Z&endtime=2025-04-23T10:30:00Z'

#######SCEDC########

#curl --output prova.dat 'https://service.scedc.caltech.edu/fdsnws/dataselect/1/query?net=CE&sta=02496&cha=HNZ&starttime=2022-11-22T15:39:00&endtime=2022-11-22T18:39:59&format=miniseed&nodata=404'

#######NCEDC########

#curl --output prova.dat 'service.ncedc.org/fdsnws/dataselect/1/query?net=NP&sta=5482&cha=HNZ&starttime=2022-11-22T15:39:00&endtime=2022-11-22T18:39:59&format=miniseed&nodata=404'

#######RASPISHAKE##############

#wget --no-check-certificate "https://fdsnws.raspberryshakedata.com/fdsnws/dataselect/1/query?net=AM&sta=R99E5&loc=00&cha=EHZ&start=2024-05-12T10:40:00&end=2024-05-12T13:40:00" -O prova.dat

######GREECE NOA##########

#curl --output prova.dat 'http://eida.gein.noa.gr/fdsnws/dataselect/1/query?starttime=2025-01-30T00%3A00%3A00&endtime=2025-03-15T23%3A59%3A59&network=HL&station=THERA&channel=HHZ&nodata=404'

######EIDA KOERI##########
#http://eida.koeri.boun.edu.tr/webinterface/


######## mseed to dat conversion  ###################################

mseed2sac prova.dat

for i in $(ls *.SAC)
do
    mv $i a.SAC
    octave estrai.m
    mv a.dat $i.dat
done

rm a.dat
cat *.SAC.dat > a.dat
    
######## for format geocsv########################

#sed '1,19d' prova.dat > a1.dat

#awk '{ print $2 }' a1.dat > a.dat

#################################################

gfortran -O3 scrivi.f
./a.out

octave filter_hilbert2.m
