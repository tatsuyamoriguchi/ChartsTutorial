//
//  LineChartViewController.swift
//  ChartsTutorial
//
//  Created by Duy Bui on 4/20/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {

    @IBOutlet var lineChartView: LineChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        let commonData = CommonData()
        let players = commonData.players
        let goals = commonData.goals
        
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        // 1. Set ChartDataEntry
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
           
            dataEntries.append(dataEntry)
        }
        // 2. Set ChartDataSet
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
        
        // 3. Set ChartData
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        
        lineChartView.leftAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        lineChartView.leftAxis.granularity = 1
        
        // 4. Assign it to the chart's data
        lineChartView.data = lineChartData
        self.lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
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
