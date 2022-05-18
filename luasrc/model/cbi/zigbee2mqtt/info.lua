local fs = require "nixio.fs"
local conffile = "/tmp/zigbee2mqtt.info"

f = SimpleForm("logview")

t = f:field(TextValue, "conf")
t.rmempty = true
t.rows = 30
function t.cfgvalue()
  luci.sys.exec("logread | grep npm > /tmp/zigbee2mqtt.info")
	return fs.readfile(conffile) or ""
end
t.readonly="readonly"

return f