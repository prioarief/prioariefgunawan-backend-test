const junctionNumber = (n) => {
  const numbers = String(n).split('')
  return n + numbers.reduce((prev, curr) => prev + +curr, 0)
}

const sumOfSelfNumbers = (max) => {
  const junctionNumbers = []
  const selfNumbers = []

  for (let i = 1; i <= max; i++) {
    junctionNumbers.push({
      number: i,
      result: junctionNumber(i)
    })
  }

  for (let i = 1; i <= max; i++) {
    if (!junctionNumbers.find((e) => e.result === i)) {
      selfNumbers.push(i)
    }
  }

  return selfNumbers.reduce((prev, curr) => prev + curr, 0)
}

console.log(sumOfSelfNumbers(5000))
console.log(sumOfSelfNumbers(100))