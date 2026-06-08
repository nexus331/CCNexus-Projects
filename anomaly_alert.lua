-- ANOMALY ALERT SYSTEM 

network = peripheral.find("modem", rednet.open)
redstone_out = "right"

function trigger_alert()
    rednet.broadcast("ALARM ACTIVATED", "anom")
    redstone.setOutput(redstone_out, true)
    sleep(30)
    redstone.setOutput(redstone_out, false)
end

function wait_command()
    id, message, protocol = rednet.receive("anom")
    print("RECIEVED FROM COMPUTER:", id, message)
    if message == "ANOMALY DETECTED" then
        trigger_alert()
    end
end

print("ANOMALY ALERT SYSTEM")
print("Waiting for command...")

while true do
wait_command()
end