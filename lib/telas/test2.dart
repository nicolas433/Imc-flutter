 return new MaterialApp(      
  title: title,
  home: new Center(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Card(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    child:
                      new CircleAvatar(
                    backgroundImage: new AssetImage('images/lake.jpg'),
                    radius: 80.0,
                      child: new Container(
                        padding: const EdgeInsets.all(0.0),
                          child: new Text('Sight'),
                          ),
                      )
                  ),
                  ),
                  new Container(
                    child: new Text('long information text'),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  )  
);