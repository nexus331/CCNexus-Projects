-- ANOMALY ALERT SYSTEM SERVER

network = peripheral.find("modem", rednet.open)
version = "1.1"

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
    send_alert()
end

function update_server()
    print("NETWORKED SYSTEM UPDATE INITIATED.")
    shell.run("anom_updater")
end

-- MAIN PROGRAM
print("ANOMALY ALERT SYSTEM")
print("Software Version:", version)



