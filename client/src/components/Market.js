import React, {Component} from 'react';

class Market extends Component {
  constructor(props) {
    super(props);
    this.getBalance();
  }

  async componentDidMount() {
    console.log(this.props)
    console.log("GETTING DAI HOLDINGS!")
    // Get the value from the contract to prove it worked.

    // Update state with the result
  }

  getBalance = async () => { 
    console.log("Checking Balance...");
    if (this.props.daiInstance && this.props.userAddress) {
        console.log("UPDATING BALANCE....")
        const response = await this.props.daiInstance.methods.balanceOf(sessionStorage.getItem('selectedAddress')).call();
        console.log(response)
    }
    setTimeout(this.getBalance, 1000);
  }

  render() {
    return (
      <div>
          <h1>MARKET {this.props.userAddress}</h1>
      </div>
    );
  }
}

export default Market;