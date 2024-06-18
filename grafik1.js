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

    // en çok satış yapan 10 ürün
    let sortedData = data.sort((a, b) => {
      let sumA = a.satisfiyatlari.split(',').reduce((sum, val) => sum + parseFloat(val), 0);
      let sumB = b.satisfiyatlari.split(',').reduce((sum, val) => sum + parseFloat(val), 0);
      return sumB - sumA;
    }).slice(0, 10);

    for (let i = 0; i < sortedData.length; i++) {
      if (param == null) {
        this.degerler.push(sortedData[i].satisfiyatlari.split(","));
      } else {
        this.degerler.push(sortedData[i].satisfiyatlari);
      }

      this.isimler.push(sortedData[i].urunadi);
    }
  }

  lineCiz(id) {
    let myChart = echarts.init(document.getElementById(id));

    let option = {
      xAxis: {
        type: "category",
        data: this.isimler,
        axisLabel: {
          interval: 0,
          rotate: 45,
          formatter: function(value) {
            return value.length > 10 ? value.substr(0, 10) + '...' : value;
          }
        }
      },
      yAxis: {
        type: "value",
      },
      tooltip: {
        trigger: 'axis',
        formatter: function(params) {
          let result = params[0].name + '<br/>';
          params.forEach(function(item) {
            result += item.marker + " " + item.seriesName + ": " + item.value + "<br/>";
          });
          return result;
        }
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
          type: "line",
          smooth: true,
          name: 'Fiyat'
        },
      ],
    };

    myChart.setOption(option);
  }

  barCiz(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
      title: {
        text: "",
      },
      tooltip: {
        trigger: "axis",
      },
      grid: {
        left: "3%",
        right: "4%",
        bottom: "3%",
        containLabel: true,
      },
      toolbox: {
        feature: {
          saveAsImage: {
            title: 'Resimleştir',
            show: true
          },
        },
      },
      xAxis: {
        type: "category",
        boundaryGap: false,
        data: ["Pzt", "Sal", "Çrs", "Prş", "Cum"],
      },
      yAxis: {
        type: "value",
      },
      series: this.isimler.map((isim, index) => ({
        name: isim,
        type: "line",
        stack: "Total",
        data: this.degerler[index],
      }))
    };

    myChart.setOption(option);
  }
}
