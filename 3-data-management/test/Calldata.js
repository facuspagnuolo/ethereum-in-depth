const Calldata = artifacts.require('Calldata')

contract('Calldata', () => {
  it('truncates a given text from the given position', async function () {
    const text = "hello world!";

    const calldata = await Calldata.new()
    const rawResult = await calldata.tail(text, 6)

    const expectedString = text.substring(6)
    const result = toAscii(rawResult)
    assert.equal(result, expectedString)
  })

  // web3 toAscii function ignores the padding
  function toAscii(hex) {
    let str = '', i = 0, l = hex.length;
    if (hex.substring(0, 2) === '0x') i = 2;
    for (; i < l; i += 2) {
      const code = parseInt(hex.substr(i, 2), 16);
      if (code === 0) continue;
      str += String.fromCharCode(code);
    }
    return str;
  }
})
