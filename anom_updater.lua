-- ANOMALY ALERT SYSTEM SOFTWARE UPDATER

function update_server()
    print("REMOTE UPDATE....")
    shell.run("delete anomaly_server")
    shell.run("wget https://raw.githubusercontent.com/nexus331/CCNexus-Projects/refs/heads/main/anomaly_server.lua")
    sleep(2)
    shell.run("reboot")
end