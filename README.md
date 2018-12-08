# ETH -> Kyber -> DAI

![](https://i.giphy.com/media/jnTYCAjDsFxwcMAJdK/giphy.webp)

I'm not stable, but my DAI is. The aforementioned reason is a fantastic argument for being able to instantly swap your ETH into DAI and send it to a contact. Currently it's only possible to send your contacts assets that you already hold, but with the same number of transactions you could send them anything which has an ETH pair on Kyber.

Sending an asset pegged to fiat within a chat context is a use-case that is tried, tested and proved.

My hackathon submission is comprised of two pieces:

- Tiny proxy contract in front of Kyber Network's proxy (proxy.sol)
- Status extension (extension.txt)

The function of each is described below.

## proxy.sol

Kyber network's own contracts currently allow you to purchase a token with ETH by directly sending ETH to the proxy contract. The proxy does not however allow us to forward the resulting token to an address that we do not control. For this reason, I have created a small contract which forwards the ETH and calls the correct function (`tradeWithHint`) in the Kyber Proxy, with a single additional argument - the address of the token receiver.

The result is exactly the same as calling the Kyber Proxy directly, except the token is immedietely delivered to the recipient.

![](https://media.giphy.com/media/3boU1mIcXHc40/giphy.gif)
(Search proxy gif and you get this bad ass chica)

## extension.txt

The Status extension component of this submission was the most difficult, which is why I have added a funny gif to my solution. Please notice it senpai.

The extension allows you to execute the command `/send-dai` with a single argument: the amount of DAI that you wish to send to your contact. Upon execution, this command then fetches the price of DAI (in ETH) from the Kyber Proxy, performs some arithmetic (surprisingly difficult in Status 🙃) to craft and send the transaction.

The extension could be a lot better, but there are some reasonably large limitations in the extensions API.

![](http://images4.fanpop.com/image/photos/14800000/skull-gifs-skulls-14883450-209-190.gif)

DOOT DOOT
