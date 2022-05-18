
a=Map("zigbee2mqtt",translate("Zigbee2mqtt"),translate("Setting for Domoticz zigbee"))
a:section(SimpleSection).template  = "zigbee2mqtt/zigbee2mqtt_status"

t=a:section(NamedSection,"sample_config","zigbee2mqtt")
t.anonymous=true
t.addremove=false

e=t:option(Flag,"enabled",translate("Enable"))
e.default=0
e.rmempty=false


return a
