module("luci.controller.zigbee2mqtt",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/zigbee2mqtt")then
return
end

entry({"admin","modem"}, firstchild(), "Modem", 45).dependent = false

entry({"admin", "modem", "zigbee2mqtt"},firstchild(), _("Zigbee2mqtt")).dependent = false

entry({"admin", "modem", "zigbee2mqtt", "general"},cbi("zigbee2mqtt/settings"), _("Base Setting"), 1)
entry({"admin", "modem", "zigbee2mqtt", "log"},form("zigbee2mqtt/info"), _("Info"), 2)
entry({"admin", "modem", "zigbee2mqtt", "manual"},cbi("zigbee2mqtt/manual"), _("Manual Config"), 3)

entry({"admin","modem","zigbee2mqtt","status"},call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("pgrep npm >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
