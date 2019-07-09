#!../../bin/linux-x86_64/test

## You may have to change test to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", ".")

## Register all support components
dbLoadDatabase("../../dbd/test.dbd",0,0)
test_registerRecordDeviceDriver(pdbbase)

#drvAsynSerialPortConfigure("portName","ttyName",priority,noAutoConnect,
#    noProcessEosIn)
#asynSetOption("portName",addr,"key","value")
drvAsynIPPortConfigure("dev1","192.168.1.4:5000", 0, 0, 0)

#asynSetTraceMask("dev1",-1,255)
#asynSetTraceIOMask("dev1",-1,255)

## Load record instances
dbLoadRecords("../../db/base.db")
dbLoadRecords("../../db/channel.db","CHANNEL=a")
dbLoadRecords("../../db/channel.db","CHANNEL=b")
dbLoadRecords("../../db/channel.db","CHANNEL=c")
dbLoadRecords("../../db/channel.db","CHANNEL=d")
dbLoadRecords("../../db/channel.db","CHANNEL=e")
dbLoadRecords("../../db/channel.db","CHANNEL=f")
dbLoadRecords("../../db/channel.db","CHANNEL=g")
dbLoadRecords("../../db/channel.db","CHANNEL=h")
dbLoadRecords("$(EPICS_BASE)/db/asynRecord.db","P=,R=asyn,PORT=dev1,ADDR=0,OMAX=40,IMAX=40")

iocInit()

## Start any sequence programs
#seq snctest,"user=fulcher"
