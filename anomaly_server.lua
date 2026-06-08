-- ANOMALY ALERT SYSTEM SERVER

network = peripheral.find("modem", rednet.open)
time = os.time()

function send_alert()
    rednet.broadcast("ANOMALY_ALERT", "anom")
end

function debug_alert()
    print("DEBUG MODE:")
    sleep(1)
    print("Broadcasting Alert Signal...")
    send_alert()
end

