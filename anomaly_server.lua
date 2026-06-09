-- ANOMALY ALERT SYSTEM SERVER

network = peripheral.find("modem", rednet.open)

function send_alert()
    print("Alert System Activated...")
    rednet.broadcast("ANOMALY DETECTED", "anom")
end

function debug_alert()
    print("DEBUG MODE:")
    sleep(1)
    print("Broadcasting Alert Signal...")
    send_alert()
end

-- NIGHTTIME ALERT
while true do
    time = os.time("ingame")
    print("The time is:", time)
    sleep(1)
    shell.run("clear")

    if time >= 18.000 and time <= 18.050 then
        send_alert()
    end
end



