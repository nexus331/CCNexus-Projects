-- ANOMALY ALERT SYSTEM 

-- VARIABLES
network = peripheral.find("modem", rednet.open)
version = "1.2"
redstone_out = "bottom"
redstone_out2 = "top"
redstone_out3 = "right"

-- FUNCTIONS
function critical_alert()
    rednet.broadcast("CRITICAL ACTIVATED", "anom")
    redstone.setOutput(redstone_out, true)
    sleep(30)
    redstone.setOutput(redstone_out, false)
end

function yellow_alert()
    rednet.broadcast("YELLOW ACTIVATED", "anom")
    redstone.setOutput(redstone_out2, true)
    sleep(0.5)
    redstone.setOutput(redstone_out2, false)
end

function update_client()
    print("NETWORKED SYSTEM UPDATE INITIATED.")
    shell.run("anom_updater")
end

function door_test()
    rednet.broadcast("AUTOMATED DOORS ACTIVATED", "anom")
    redstone.setOutput(redstone_out3, true)
    sleep(10)
    redstone.setOutput(redstone_out3, false)
end

function wait_command()
    id, message, protocol = rednet.receive("anom")
    print("RECIEVED FROM COMPUTER:", id, message)
    if message == "critalert" then
        critical_alert()
    elseif message == "yellowalert" then
        yellow_alert()
    elseif message == "update_anom" then
        update_client()
    elseif message == "testdoors" then
        door_test()
    end
end

-- MAIN PROGRAM 

print("ANOMALY ALERT SYSTEM")
print("Software Version:", version)
print("Waiting for command...")

while true do
wait_command()
end