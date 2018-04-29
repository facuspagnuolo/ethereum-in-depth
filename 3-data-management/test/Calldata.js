const Calldata = artifacts.require('Calldata')

contract('Calldata', () => {
  it('truncates a given text from the given position', async function () {
    const text = "hello world!";

    const calldata = await Calldata.new()
    const rawResult = await calldata.tail(text, 6)

    const expectedString = text.substring(6)
    const result = web3.toAscii(rawResult).replace(/\0/g, '')
    assert.equal(result, expectedString)
  })
})
