-- ANOMALY ALERT SYSTEM SERVER

network = peripheral.find("modem", rednet.open)
version = "1.2"

function crit_alert()
    print("Broadcasting Critical Alert...")
    rednet.broadcast("critalert", "anom")
end

function yellow_alert()
    print("Broadcasting Yellow Alert...")
    rednet.broadcast("yellowalert", "anom")
end

function debug_alert()
    print("DEBUG MODE:")
    sleep(1)
    print("Broadcasting Alert Signal...")
    crit_alert()
end

function door_test()
    print("Initiating Automated Doors Test...")
    rednet.broadcast("testdoors", "anom")
end

function update_server()
    print("NETWORKED SYSTEM UPDATE INITIATED.")
    shell.run("anom_updater")
end

-- MAIN PROGRAM
print("ANOMALY ALERT SYSTEM")
print("Software Version:", version)

while true do
    id, message, protocol = rednet.receive("anom")
    print("DEBUG:", message)
    if message == "server_critical" then
        crit_alert()
    elseif message == "server_yellow" then
        yellow_alert()
    elseif message == "server_door" then
        door_test()
    elseif message == "update_anom" then
        update_server()
    end
end



