const main = async () => {
    const contractFactory = await hre.ethers.getContractFactory('NFTeddy');
    const nftContract = await contractFactory.deploy();
    await nftContract.deployed();
    console.log("NFTeddy deployed");

    let txn = await nftContract.makeAnNFTeddy();
    await txn.wait();

    txn = await nftContract.makeAnNFTeddy();
    await txn.wait();

}

const runMain = async () => {
    try {
        await main();
        process.exit(0)
    }catch(error){
        console.log(error);
        process.exit(1);
    }

}

runMain();