//
//  BarChartViewController.swift
//  ChartsTutorial
//
//  Created by Duy Bui on 4/20/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {

    
    @IBOutlet var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let commonData = CommonData()
        let players = commonData.players
        let goals = commonData.goals
        
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }

    func customizeChart(dataPoints: [String], values: [Double]) {
        // 1. Set ChartDataEntry
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        // 2. Set ChartDataSet
        let barChartDataSet = BarChartDataSet(entries: dataEntries, label: "Bar Chart View")
        // 3. Set ChartData
        let barChartData = BarChartData(dataSet: barChartDataSet)
       // let barChartData = BarChartData(xVals: dataPoints, dataSet: barChartDataSet)
        
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        barChartView.xAxis.granularity = 1
        
        // 4. Assign it to the chart's data
        barChartView.data = barChartData
        self.barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



