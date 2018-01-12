cfg={
    _id:"replica1",
    members:[
        {_id:0, host:" 10.20.0.168:27001"},
        {_id:1, host:" 10.20.0.168:27002"},
        {_id:2, host:" 10.20.0.168:27003"},
        {_id:3, host:" 10.20.0.168:27004"},
        {_id:4, host:" 10.20.0.168:27005", arbiterOnly: true }
    ]
};
rs.initiate(cfg);
sleep(2000);