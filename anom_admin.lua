-- ANOMALY ALERT SYSTEM ADMINISTRATOR APP

-- VARIABLES
network = peripheral.find("modem", rednet.open)

-- FUNCTIONS

function yellow_alert()
    print("DEBUG: YELLOW ALERT ISSUED!")
    rednet.broadcast("server_yellow", "anom")
end

function critical_alert()
    print("DEBUG: CRITICAL ALERT ISSUED!")
    rednet.broadcast("server_critical", "anom")
end

function doors_test()
    print("DEBUG: TESTING AUTO DOORS...")
    rednet.broadcast("server_door", "anom")
end

function update()
    print("UPDATING ALL SYSTEMS...")
    rednet.broadcast("update_anom", "anom")
end

-- MAIN PROGRAM