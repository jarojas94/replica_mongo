cfg={
    _id:"replica1",
    members:[
        {_id:0, host:" localhost:27001"},
        {_id:1, host:" localhost:27002"},
        {_id:2, host:" localhost:27003"},
        {_id:3, host:" localhost:27004"},
        {_id:4, host:" localhost:27005", arbiterOnly: true }
    ]
};
rs.initiate(cfg);
sleep(2000);