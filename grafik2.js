class tabloVerileri {
  isimler = [];
  degerler = [];

  async bilgiGetir(param = null) {
      this.isimler = [];
      this.degerler = [];

      let result = await fetch("bilgigetir/" + (param == null ? "" : `?fn=${param}`));
      let data = await result.json();

      // Use a Set to avoid duplicates
      let uniqueNames = new Set();

      for (let i = 0; i < data.length; i++) {
          if (param == null) {
              this.degerler.push(data[i].satisfiyatlari.split(","));
          } else {
              this.degerler.push(data[i].satisfiyatlari);
          }

          data[i].urungrubu.split(', ').forEach(name => uniqueNames.add(name));
      }

      // Convert Set back to array
      this.isimler = Array.from(uniqueNames);
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
                data: this.degerler.map((value, index) => ({
                    value: value,
                    itemStyle: {
                        color: ['#00076d', '#98a9ff', '#7586ff', '#003783', '#c8d9ff'][index % 10]
                    }
                })),
                type: "bar",
                smooth: true
            }
        ],
      };

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
                  data: this.degerler.map((value, index) => ({
                    value,
                    name: this.isimler[index],
                    itemStyle: {
                        //color: ['#ea4081', '#1c78db', '#00ff99', '#fd2ef6'][index % 5]
                        color: ['#00076d', '#98a9ff', '#7586ff', '#003783', '#c8d9ff'][index % 5]
                    }
                })),
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
