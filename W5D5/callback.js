class Clock {
  constructor() {
    const d = new Date();
    this.seconds =  d.getSeconds();
    this.minutes =  d.getMinutes();
    this.hours =  d.getHours();
    global.setInterval(this._tick.bind(this), 1000);
  }

  _tick() {
    console.clear();
    this.incrementSeconds();
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
  };

  incrementSeconds() {
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0
      this.incrementMinutes();
    };
  };

  incrementMinutes() {
    this.minutes += 1;
    if (this.minutes === 60) {
      this.minutes = 0;
      this.incrementHours();
    };
  };
  
  incrementHours() {
    this.hours += 1;
    if (this.hours === 24) {
      this.hours = 0;
    };
  };
}
// const myClock = new Clock();

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    return;
  };

  reader.question("What number would you like to add to sum?", function(input) {
    const incrementer = parseInt(input);
    sum += incrementer;
    console.log(sum)
    numsLeft -= 1;
    addNumbers(sum, numsLeft, completionCallback);
  });
}

// addNumbers(0, 5, console.log);
// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`${el1} greater than ${el2}? [yes/no]`, function(input) {
    if (input === 'yes') {
      callback(true);
    } else {
      callback(false);
    };
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  if (i === arr.length-1 ) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i+1], input => {
      if (input === true) {
        const temp = arr[i+1];
        arr[i+1] = arr[i];
        arr[i] = temp;
        innerBubbleSortLoop(arr, i+1, true, outerBubbleSortLoop);
      } else {
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      };
    });
  };
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    };
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

// absurdBubbleSort([3, 2, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function(context) {
  // return () => this.apply(context);
  let that = this;
  return function() {
    that.apply(context);
  }
} 

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"

class Game {
  constructor() {
    this.towers = [[3,2,1],[],[]];
  }
}


// Write a Game.prototype.promptMove method that 
// (1) prints the stacks, and 
// (2) asks the user where they want to move a disc to/from. Pass the startTowerIdx and endTowerIdx to a callback.
