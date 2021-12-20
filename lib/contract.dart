import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import 'contract.g.dart';

const String rpcUrl = 'https://api.avax-test.network/ext/bc/C/rpc';
const String wsUrl = 'ws://api.avax-test.network/ext/bc/C/rpc';

const String privateKey =
    '9a43d93a50b622761d88c80c90567c02c82442746335a01b72f49b3c867c037d';

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0xC858757c306081aAF4FCcD76B889b2866E992cF6');

final EthereumAddress pubKey =
    EthereumAddress.fromHex('0x6c87E1a114C3379BEc929f6356c5263d62542C13');

class ChaindityContract {
  static Future<void> main() async {
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    final client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });
    final credentials = EthPrivateKey.fromHex(privateKey);
    final ownAddress = await credentials.extractAddress();
    // read the contract abi and tell web3dart where it's deployed (contractAddr)
    final contract =
        Contract(address: contractAddr, client: client, chainId: 43113);

    await contract.MintId("Aman aman nerelere geldik",
        credentials: credentials,
        transaction: Transaction(from: ownAddress, maxGas: 3000000));

    /*
  // listen for the Transfer event when it's emitted by the contract above
  final subscription = contract.transferEvents().take(1).listen((event) {
    print('${event.from} sent ${event.value} MetaCoins to ${event.to}!');
  });

  // check our balance in MetaCoins by calling the appropriate function
  final balance = await contract.getBalance(ownAddress);
  print('We have $balance MetaCoins');

  // send all our MetaCoins to the other address by calling the sendCoin
  // function
  await contract.sendCoin(receiver, balance, credentials: credentials);

  await subscription.asFuture();
  await subscription.cancel();
  */

    await client.dispose();
  }
}
