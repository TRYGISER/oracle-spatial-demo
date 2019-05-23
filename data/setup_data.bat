@echo off

:sqlplus /nolog @create_schema.sql
:echo exit | sqlplus spatialdemo/spatialdemo@localhost:1521/orcl @cities15000.sql
java -classpath ojdbc5.jar;sdoutl.jar;sdoapi.jar oracle.spatial.util.SampleShapefileToJGeomFeature -h localhost -p 1521 -s orcl -u spatialdemo -d spatialdemo -t shapefile -f world-bounds-a -r 8307 -o 0.005
:echo exit | sqlplus spatialdemo/spatialdemo@localhost:1521/orcl @convert_countries.sql
pause
