//
//  ViewController.swift
//  YachtDice
//
//  Created by Andrew Lin on 2022-03-23.
//

import UIKit

class ViewController: UIViewController {
    
    //dice image view
    @IBOutlet weak var diceView1: UIImageView!
    @IBOutlet weak var diceView2: UIImageView!
    @IBOutlet weak var diceView3: UIImageView!
    @IBOutlet weak var diceView4: UIImageView!
    @IBOutlet weak var diceView5: UIImageView!
    
    //roll button and rolls left num
    @IBOutlet weak var rollButtonView: UIButton!
    @IBOutlet weak var rollsLeftView: UILabel!
    
    //pick (PICK) & remove (RM) button (to hide when picked)
    @IBOutlet weak var pickdice1View: UIButton!
    @IBOutlet weak var pickdice2View: UIButton!
    @IBOutlet weak var pickdice3View: UIButton!
    @IBOutlet weak var pickdice4View: UIButton!
    @IBOutlet weak var pickdice5View: UIButton!
    @IBOutlet weak var removedice1View: UIButton!
    @IBOutlet weak var removedice2View: UIButton!
    @IBOutlet weak var removedice3View: UIButton!
    @IBOutlet weak var removedice4View: UIButton!
    @IBOutlet weak var removedice5View: UIButton!
    
    //lock in (used to hide the button as soon as that category is locked in)
    @IBOutlet weak var acesLockView: UIButton!
    @IBOutlet weak var twosLockView: UIButton!
    @IBOutlet weak var threesLockView: UIButton!
    @IBOutlet weak var foursLockView: UIButton!
    @IBOutlet weak var fivesLockView: UIButton!
    @IBOutlet weak var sixesLockView: UIButton!
    @IBOutlet weak var chanceLockView: UIButton!
    @IBOutlet weak var fourOfAKindLockView: UIButton!
    @IBOutlet weak var fullHouseLockView: UIButton!
    @IBOutlet weak var smallStraightLockView: UIButton!
    @IBOutlet weak var largeStraightLockView: UIButton!
    @IBOutlet weak var yachtLockView: UIButton!
    
    //total Score View
    @IBOutlet weak var totalScoreView: UILabel!
    
    //dice in rack image view
    @IBOutlet weak var rackdice1: UIImageView!
    @IBOutlet weak var rackdice2: UIImageView!
    @IBOutlet weak var rackdice3: UIImageView!
    @IBOutlet weak var rackdice4: UIImageView!
    @IBOutlet weak var rackdice5: UIImageView!
    
    //categories num value
    @IBOutlet weak var acesNumView: UILabel!
    @IBOutlet weak var twosNumView: UILabel!
    @IBOutlet weak var threesNumView: UILabel!
    @IBOutlet weak var foursNumView: UILabel!
    @IBOutlet weak var fivesNumView: UILabel!
    @IBOutlet weak var sixesNumView: UILabel!
    @IBOutlet weak var chanceNumView: UILabel!
    @IBOutlet weak var fourKindNumView: UILabel!
    @IBOutlet weak var fullHouseNumView: UILabel!
    @IBOutlet weak var smallStraightNumView: UILabel!
    @IBOutlet weak var largeStraightNumView: UILabel!
    @IBOutlet weak var yachtNumView: UILabel!
    
    
    //rolls counter
    var rollsLeft = 3
    
    //var for the next available rack dice -1 (-1 because this var used for the index of arr)
    var currRackDice = 0
    
    //total Score variable and upper for +35 if 63+
    var totalScore = 0
    var upperScore = 0
    
    //holding each dices current number
    var currDice1 = 1
    var currDice2 = 1
    var currDice3 = 1
    var currDice4 = 1
    var currDice5 = 1
    
    //boolean to check if dice is in rack
    var dice1InRack = false
    var dice2InRack = false
    var dice3InRack = false
    var dice4InRack = false
    var dice5InRack = false

    
    //variables to check if the category is locked already
    var aces = false
    var twos = false
    var threes = false
    var fours = false
    var fives = false
    var sixes = false
    var chance = false
    var fourOfAKind = false
    var fullHouse = false
    var smallStraight = false
    var largeStraight = false
    var yacht = false
    var finished = 0
    
    //arr variable to hold the values of the dice in the rack
    var rackDiceNums = [Int]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //pan gesture for dragging an image
 

    }
    
    //this function is called in the resetAfterLockIn function to set all the category numbers that have not been locked back to "0"
    func categoriesNotLockedZero() {
        if (!aces) {
            acesNumView.text = "0"
        }
        if (!twos) {
            twosNumView.text = "0"
        }
        if (!threes) {
            threesNumView.text = "0"
        }
        if (!fours) {
            foursNumView.text = "0"
        }
        if (!fives) {
            fivesNumView.text = "0"
        }
        if (!sixes) {
            sixesNumView.text = "0"
        }
        if (!chance) {
            chanceNumView.text = "0"
        }
        if (!fourOfAKind) {
            fourKindNumView.text = "0"
        }
        if (!fullHouse) {
            fullHouseNumView.text = "0"
        }
        if (!smallStraight) {
            smallStraightNumView.text = "0"
        }
        if (!largeStraight) {
            largeStraightNumView.text = "0"
        }
        if (!yacht) {
            yachtNumView.text = "0"
        }
    }
    
    //this runs after a category is locked in
    func resetAfterLockIn() {
        //reset the dice values
        currDice1 = 1
        currDice2 = 1
        currDice3 = 1
        currDice4 = 1
        currDice5 = 1
        
        //reset rolls
        rollsLeft = 3
        
        //reset rolls left text
        rollsLeftView.text = "3"
        
        //hide all rack dice and remove buttons
        rackdice1.isHidden = true
        rackdice2.isHidden = true
        rackdice3.isHidden = true
        rackdice4.isHidden = true
        rackdice5.isHidden = true
        removedice1View.isHidden = true
        removedice2View.isHidden = true
        removedice3View.isHidden = true
        removedice4View.isHidden = true
        removedice5View.isHidden = true
        
        //unhide all dice images
        diceView1.isHidden = false
        diceView2.isHidden = false
        diceView3.isHidden = false
        diceView4.isHidden = false
        diceView5.isHidden = false
        
        //set rack dice all to false
        dice1InRack = false
        dice2InRack = false
        dice3InRack = false
        dice4InRack = false
        dice5InRack = false
        
        //hide all pick butons
        pickdice1View.isHidden = true
        pickdice2View.isHidden = true
        pickdice3View.isHidden = true
        pickdice4View.isHidden = true
        pickdice5View.isHidden = true
        
        //unhide roll button
        rollButtonView.isHidden = false
        
        finished += 1
        
        rackDiceNums = [Int]()
        
        categoriesNotLockedZero()
        
        if (upperScore >= 63) {
            totalScore += 35
            totalScoreView.text = String(totalScore)
        }
        
        if (finished == 12) {
            print("game over bitches")
        }

    }

    
    //lock in categories
    @IBAction func lockAces(_ sender: UIButton) {
        aces = true
        acesNumView.textColor = UIColor.cyan
        acesLockView.isHidden = true
        totalScore += Int(acesNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        upperScore += Int(acesNumView.text ?? "0")!
        resetAfterLockIn()
        
    }
    
    @IBAction func lockTwos(_ sender: UIButton) {
        twos = true
        twosNumView.textColor = UIColor.cyan
        twosLockView.isHidden = true
        totalScore += Int(twosNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        upperScore += Int(acesNumView.text ?? "0")!
        resetAfterLockIn()
    }
    
    @IBAction func lockThrees(_ sender: UIButton) {
        threes = true
        threesNumView.textColor = UIColor.cyan
        threesLockView.isHidden = true
        totalScore += Int(threesNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        upperScore += Int(acesNumView.text ?? "0")!
        resetAfterLockIn()
    }
    
    @IBAction func lockFours(_ sender: UIButton) {
        fours = true
        foursNumView.textColor = UIColor.cyan
        foursLockView.isHidden = true
        totalScore += Int(foursNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        upperScore += Int(acesNumView.text ?? "0")!
        resetAfterLockIn()
    }
    
    @IBAction func lockFives(_ sender: UIButton) {
        fives = true
        fivesNumView.textColor = UIColor.cyan
        fivesLockView.isHidden = true
        totalScore += Int(fivesNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        upperScore += Int(acesNumView.text ?? "0")!
        resetAfterLockIn()
    }
    
    @IBAction func lockSixes(_ sender: UIButton) {
        sixes = true
        sixesNumView.textColor = UIColor.cyan
        sixesLockView.isHidden = true
        totalScore += Int(sixesNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        upperScore += Int(acesNumView.text ?? "0")!
        resetAfterLockIn()
    }
    
    @IBAction func lockChance(_ sender: UIButton) {
        chance = true
        chanceNumView.textColor = UIColor.cyan
        chanceLockView.isHidden = true
        totalScore += Int(chanceNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        resetAfterLockIn()
    }
    
    @IBAction func lockFourOfAKind(_ sender: UIButton) {
        fourOfAKind = true
        fourKindNumView.textColor = UIColor.cyan
        fourOfAKindLockView.isHidden = true
        totalScore += Int(fourKindNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        resetAfterLockIn()
    }
    
    @IBAction func lockFullHouse(_ sender: UIButton) {
        fullHouse = true
        fullHouseNumView.textColor = UIColor.cyan
        fullHouseLockView.isHidden = true
        totalScore += Int(fullHouseNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        resetAfterLockIn()
    }
    
    @IBAction func lockSmallStraight(_ sender: UIButton) {
        smallStraight = true
        smallStraightNumView.textColor = UIColor.cyan
        smallStraightLockView.isHidden = true
        totalScore += Int(smallStraightNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        resetAfterLockIn()
    }
    
    @IBAction func lockLargeStraight(_ sender: UIButton) {
        largeStraight = true
        largeStraightNumView.textColor = UIColor.cyan
        largeStraightLockView.isHidden = true
        totalScore += Int(largeStraightNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        resetAfterLockIn()
    }
    
    @IBAction func lockYacht(_ sender: UIButton) {
        yacht = true
        yachtNumView.textColor = UIColor.cyan
        yachtLockView.isHidden = true
        totalScore += Int(yachtNumView.text ?? "0")!
        totalScoreView.text = String(totalScore)
        resetAfterLockIn()
    }
    

    
    //update the value of categories when picked
    func updateAllCategoriesPicked(diceRoll: Int) {
        //Left Section (e.g aces, twos)
        if (diceRoll == 1 && !aces) {
            let x = Int(acesNumView.text ?? "0")
            var y = x!;
            y += 1
            acesNumView.text = String(y)
        }
        else if (diceRoll == 2 && !twos) {
            let x = Int(twosNumView.text ?? "0")
            var y = x!;
            y += 2
            twosNumView.text = String(y)
        }
        else if (diceRoll == 3 && !threes) {
            let x = Int(threesNumView.text ?? "0")
            var y = x!;
            y += 3
            threesNumView.text = String(y)
        }
        else if (diceRoll == 4 && !fours) {
            let x = Int(foursNumView.text ?? "0")
            var y = x!;
            y += 4
            foursNumView.text = String(y)
        }
        else if (diceRoll == 5 && !fives) {
            let x = Int(fivesNumView.text ?? "0")
            var y = x!;
            y += 5
            fivesNumView.text = String(y)
        }
        else if (diceRoll == 6 && !sixes) {
            let x = Int(sixesNumView.text ?? "0")
            var y = x!;
            y += 6
            sixesNumView.text = String(y)
        }
        
        
        //Right Section (e.g chance, yahct)
        //**** THIS PART NEEDS A LOT OF PLANNING AND TESTING ALL POSSIBILITES
        
        //Chance: activate for all of the dice in the rack
        if (!chance) {
            var x = 0
            for num in rackDiceNums {
                x += num
            }
            chanceNumView.text = String(x)
            
        }
        
        //4 Of a Kind: Only activate when there is at least 4 of the same number inside the rack
        if (!fourOfAKind) {
            var total = 0
            
            for num in rackDiceNums {
                total += num
            }
            var numDict: [Int: Int] = [:]
            for num in rackDiceNums {
                if (numDict[num] == nil) {
                    numDict[num] = 1
                }
                else {
                    numDict[num] = numDict[num]! + 1
                }
            }
            
            for (_, val) in numDict {
                if (val >= 4){
                    fourKindNumView.text = String(total)
                }
            }
        }
        /*
         *************GOTTA THINK ABOUT THIS ONE*************
         */
        //Full House: Only activate when there is 3 of same number and 2 of same number (WATCH OUT AS [5,5,5,5,5] IS CONSIDERED FULL HOUSE
        if (!fullHouse) {
            if (rackDiceNums.count == 5) {
                rackDiceNums.sort()
                
                var total = 0
                
                for num in rackDiceNums {
                    total += num
                }
                
                if (rackDiceNums[0] == rackDiceNums[1] && rackDiceNums[1] == rackDiceNums[2] && rackDiceNums[3] == rackDiceNums[4]) || (rackDiceNums[0] == rackDiceNums[1] && rackDiceNums[2] == rackDiceNums[3] && rackDiceNums[3] == rackDiceNums[4]) {
                    fullHouseNumView.text = String(total)
                }
            }
        }
        
        //Small Straight: Only activate when there is either [1,2,3,4] || [2,3,4,5] || [3,4,5,6]
        if (!smallStraight) {
            if (rackDiceNums.contains(1) && rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4)) || (rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5)) || (rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5) && rackDiceNums.contains(6)){
                smallStraightNumView.text = "15"
            }
            else {
                smallStraightNumView.text = "0"
            }

           


        }
        
        //Large Straight: Only activate when ther is either [1,2,3,4,5] || [2,3,4,5,6]
        if (!largeStraight) {
            if (rackDiceNums.contains(1) && rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5)) || (rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5) && rackDiceNums.contains(6)){
                largeStraightNumView.text = "30"
            }

            else  {
                largeStraightNumView.text = "0"
            }

        }
        
        //Yacht: Only activate when there is 5 of the same number
        if (!yacht) {
            if (rackDiceNums.count == 5) {
                var indexZero = rackDiceNums[0]
                var allSame = true
                for i in 1...rackDiceNums.count-1 {
                    if (rackDiceNums[i] != indexZero) {
                        allSame = false
                    }
                }
                
                if (allSame) {
                    yachtNumView.text = "50"
                }
            }
            
        }
        
        
        
        
    }
    
    //update the value of categories when removed
    func updateAllCategoriesRemoved(diceRoll: Int) {
        //Left Section (e.g aces, twos)
        if (diceRoll == 1 && !aces) {
            let x = Int(acesNumView.text ?? "0")
            var y = x!;
            y -= 1
            acesNumView.text = String(y)
        }
        else if (diceRoll == 2 && !twos) {
            let x = Int(twosNumView.text ?? "0")
            var y = x!;
            y -= 2
            twosNumView.text = String(y)
        }
        else if (diceRoll == 3 && !threes) {
            let x = Int(threesNumView.text ?? "0")
            var y = x!;
            y -= 3
            threesNumView.text = String(y)
        }
        else if (diceRoll == 4 && !fours) {
            let x = Int(foursNumView.text ?? "0")
            var y = x!;
            y -= 4
            foursNumView.text = String(y)
        }
        else if (diceRoll == 5 && !fives) {
            let x = Int(fivesNumView.text ?? "0")
            var y = x!;
            y -= 5
            fivesNumView.text = String(y)
        }
        else if (diceRoll == 6 && !sixes) {
            let x = Int(sixesNumView.text ?? "0")
            var y = x!;
            y -= 6
            sixesNumView.text = String(y)
        }
        
        
        //Right Section (e.g chance, yahct)
        //**** THIS PART NEEDS A LOT OF PLANNING AND TESTING ALL POSSIBILITES
        if (!chance) {
            var x = 0
            for num in rackDiceNums {
                x += num
            }
            chanceNumView.text = String(x)
            
        }
        
        /*
         *************GOTTA THINK ABOUT THIS ONE*************
         */
        //Full House: Only activate when there is 3 of same number and 2 of same number (WATCH OUT AS [5,5,5,5,5] IS CONSIDERED FULL HOUSE
        if (!fullHouse) {
            if (rackDiceNums.count == 5) {
                rackDiceNums.sort()
                
                var total = 0
                
                for num in rackDiceNums {
                    total += num
                }
                
                if (rackDiceNums[0] == rackDiceNums[1] && rackDiceNums[1] == rackDiceNums[2] && rackDiceNums[3] == rackDiceNums[4]) || (rackDiceNums[0] == rackDiceNums[1] && rackDiceNums[2] == rackDiceNums[3] && rackDiceNums[3] == rackDiceNums[4]) {
                    fullHouseNumView.text = String(total)
                }
                else {
                    fullHouseNumView.text = "0"
                }
            }
        }
        
        //4 Of a Kind: Only activate when there is at least 4 of the same number inside the rack
        if (!fourOfAKind) {
            var total = 0
            var changed = false
            
            for num in rackDiceNums {
                total += num
            }
            var numDict: [Int: Int] = [:]
            for num in rackDiceNums {
                if (numDict[num] == nil) {
                    numDict[num] = 1
                }
                else {
                    numDict[num] = numDict[num]! + 1
                }
            }
            
            for (_, val) in numDict {
                if (val >= 4){
                    fourKindNumView.text = String(total)
                    changed = true
                }
            }
            
            if (changed == false) {
                fourKindNumView.text = "0"
            }
        }
        
        //Small Straight: Only activate when there is either [1,2,3,4] || [2,3,4,5] || [3,4,5,6]
        if (!smallStraight) {
            if (rackDiceNums.contains(1) && rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4)) || (rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5)) || (rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5) && rackDiceNums.contains(6)){
                smallStraightNumView.text = "15"
            }
            else {
                smallStraightNumView.text = "0"
            }

           


        }
        
        //Large Straight: Only activate when ther is either [1,2,3,4,5] || [2,3,4,5,6]
        if (!largeStraight) {
            if (rackDiceNums.contains(1) && rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5)) || (rackDiceNums.contains(2) && rackDiceNums.contains(3) && rackDiceNums.contains(4) && rackDiceNums.contains(5) && rackDiceNums.contains(6)){
                largeStraightNumView.text = "30"
            }

            else  {
                largeStraightNumView.text = "0"
            }

        }
        
        //Yacht: Only activate when there is 5 of the same number
        if (!yacht) {
            if (rackDiceNums.count == 5) {
                var indexZero = rackDiceNums[0]
                var allSame = true
                for i in 1...rackDiceNums.count-1 {
                    if (rackDiceNums[i] != indexZero) {
                        allSame = false
                    }
                }
                
                if (allSame) {
                    yachtNumView.text = "50"
                }
            }
            
        }

        
        
        
    
        
    }
    

    @IBAction func dice1Picked(_ sender: UIButton) {
        rackdice1.image = diceView1.image
        rackdice1.isHidden = false
        diceView1.isHidden = true
        pickdice1View.isHidden = true
        
        removedice1View.isHidden = false
        dice1InRack = true
        
        //add values to rack Arr to deal with lower categories
        rackDiceNums.append(currDice1)
        //print(rackDiceNums)
        updateAllCategoriesPicked(diceRoll: currDice1)
  
    }
    
    
    @IBAction func dice2Picked(_ sender: UIButton) {
        rackdice2.image = diceView2.image
        rackdice2.isHidden = false
        diceView2.isHidden = true
        pickdice2View.isHidden = true
        dice2InRack = true
        removedice2View.isHidden = false
       
        rackDiceNums.append(currDice2)
        //print(rackDiceNums)
        updateAllCategoriesPicked(diceRoll: currDice2)
    }
    
    @IBAction func dice3Picked(_ sender: UIButton) {
        rackdice3.image = diceView3.image
        rackdice3.isHidden = false
        diceView3.isHidden = true
        pickdice3View.isHidden = true
        dice3InRack = true
        removedice3View.isHidden = false
        
        rackDiceNums.append(currDice3)
        //print(rackDiceNums)
        updateAllCategoriesPicked(diceRoll: currDice3)
    }
    
    
    @IBAction func dice4Picked(_ sender: UIButton) {
        rackdice4.image = diceView4.image
        rackdice4.isHidden = false
        diceView4.isHidden = true
        pickdice4View.isHidden = true
        dice4InRack = true
        removedice4View.isHidden = false
        
        rackDiceNums.append(currDice4)
        //print(rackDiceNums)
        updateAllCategoriesPicked(diceRoll: currDice4)

    }
    

    @IBAction func dice5Picked(_ sender: UIButton) {
        rackdice5.image = diceView5.image
        rackdice5.isHidden = false
        diceView5.isHidden = true
        pickdice5View.isHidden = true
        dice5InRack = true
        removedice5View.isHidden = false
        
        rackDiceNums.append(currDice5)
        //print(rackDiceNums)
        updateAllCategoriesPicked(diceRoll: currDice5)

    }
    
    @IBAction func dice1Removed(_ sender: UIButton) {
        rackdice1.isHidden = true
        diceView1.isHidden = false
        pickdice1View.isHidden = false
        removedice1View.isHidden = true
        
        
        for i in 0...rackDiceNums.count-1 {
            if (rackDiceNums[i] == currDice1) {
                rackDiceNums.remove(at: i)
                break
            }
        }
        //print(rackDiceNums)
        updateAllCategoriesRemoved(diceRoll: currDice1)
    }
    
    @IBAction func dice2Removed(_ sender: UIButton) {
        rackdice2.isHidden = true
        diceView2.isHidden = false
        pickdice2View.isHidden = false
        removedice2View.isHidden = true
        
        
        for i in 0...rackDiceNums.count-1 {
            if (rackDiceNums[i] == currDice2) {
                rackDiceNums.remove(at: i)
                break
            }
        }
        //print(rackDiceNums)
        updateAllCategoriesRemoved(diceRoll: currDice2)
    }
    
    @IBAction func dice3Removed(_ sender: UIButton) {
        rackdice3.isHidden = true
        diceView3.isHidden = false
        pickdice3View.isHidden = false
        removedice3View.isHidden = true
        
        
        for i in 0...rackDiceNums.count-1 {
            if (rackDiceNums[i] == currDice3) {
                rackDiceNums.remove(at: i)
                break
            }
        }
        //print(rackDiceNums)
        updateAllCategoriesRemoved(diceRoll: currDice3)
    }
    
    @IBAction func dice4Removed(_ sender: UIButton) {
        rackdice4.isHidden = true
        diceView4.isHidden = false
        pickdice4View.isHidden = false
        removedice4View.isHidden = true
        
        for i in 0...rackDiceNums.count-1 {
            if (rackDiceNums[i] == currDice4) {
                rackDiceNums.remove(at: i)
                break
            }
        }
        //print(rackDiceNums)
        updateAllCategoriesRemoved(diceRoll: currDice4)
    }
    
    @IBAction func dice5Removed(_ sender: UIButton) {
        rackdice5.isHidden = true
        diceView5.isHidden = false
        pickdice5View.isHidden = false
        removedice5View.isHidden = true
        
        for i in 0...rackDiceNums.count-1 {
            if (rackDiceNums[i] == currDice5) {
                rackDiceNums.remove(at: i)
                break
            }
        }
        //print(rackDiceNums)
        updateAllCategoriesRemoved(diceRoll: currDice5)
    }
    
    
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollsLeft -= 1
        
        rollsLeftView.text = String(rollsLeft)
        var diceNames = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        
        if (!dice1InRack){
            currDice1 = Int.random(in: 1...6)
            pickdice1View.isHidden = false
        }
        
        if (!dice2InRack) {
            currDice2 = Int.random(in: 1...6)
            pickdice2View.isHidden = false
        }
        
        if (!dice3InRack) {
            currDice3 = Int.random(in: 1...6)
            pickdice3View.isHidden = false
        }
        
        if (!dice4InRack) {
            currDice4 = Int.random(in: 1...6)
            pickdice4View.isHidden = false
        }
        
        if (!dice5InRack) {
            currDice5 = Int.random(in: 1...6)
            pickdice5View.isHidden = false
        }
        
        
        var d1 = diceNames[currDice1-1]
        var d2 = diceNames[currDice2-1]
        var d3 = diceNames[currDice3-1]
        var d4 = diceNames[currDice4-1]
        var d5 = diceNames[currDice5-1]
        
        
        diceView1.image = UIImage(named: d1)
        diceView2.image = UIImage(named: d2)
        diceView3.image = UIImage(named: d3)
        diceView4.image = UIImage(named: d4)
        diceView5.image = UIImage(named: d5)
        
        if (rollsLeft == 0) {
            rollButtonView.isHidden = true
        }
        
        
        
        
        
    }
    

    
}

