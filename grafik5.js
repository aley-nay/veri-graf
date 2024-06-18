class tabloVerileri {
  isimler = [];
  degerler = [];

  async bilgiGetir(param = null) {
    this.isimler = [];
    this.degerler = [];
    // herhangi bir değer girilmezse null kabul edilir
    let result = await fetch(
      "bilgigetir/" + (param == null ? "" : `?fn=${param}`)
    );
    let data = await result.json();

    for (let i = 0; i < data.length; i++) {
      if (param == null) {
        this.degerler.push(data[i].satisfiyatlari.split(","));
      } else {
        this.degerler.push(data[i].satisfiyatlari);
      }

      this.isimler.push(data[i].urunturu);
    }
  }

  barCiz(id) {
    let myChart = echarts.init(document.getElementById(id));

    let option = {
      xAxis: {
        type: "category",
        data: this.isimler,
      },
      yAxis: {
        type: "value",
      },
      toolbox: {
        feature: {
          saveAsImage: {
            title: 'Resimleştir',
            show: true
          },
        },
      },
      series: [
        {
          data: this.degerler,
          type: "bar",
          smooth: true,
        },
      ],
    };

    // Display the chart using the configuration items and data just specified.
    myChart.setOption(option);
  }

    

  
  Pie1(id) {
    var myChart = echarts.init(document.getElementById(id));
      var option = {
      title: {
        text: "",
        subtext: "",
        left: "center",
      },
      tooltip: {
        trigger: "item",
      },
      toolbox: {
        feature: {
          saveAsImage: {
            title: 'Resimleştir',
            show: true
          },
        },
      },
      legend: {
        orient: "horizontal", 
        left: "center",
        bottom: "0",
        textStyle: {
          color: 'black',
          fontSize: 12
        },
      },
      series: [
        {
          name: "",
          type: "pie",
          radius: "50%",
          data: this.degerler.map((value, index) => ({ value, name: this.isimler[index] })),
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: "rgba(0, 0, 0, 0.5)",
            },
          },
        },
      ],
    };
  
    myChart.setOption(option);
}

}
