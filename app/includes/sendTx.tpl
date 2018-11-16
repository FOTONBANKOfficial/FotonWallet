<main class="tab-pane active"
      ng-if="globalService.currentTab==globalService.tabs.sendTransaction.id"
      ng-controller='sendTxCtrl'
      ng-cloak >

  <!-- Header : todo turn into warning notification-->
  <div class="alert alert-info" ng-show="hasQueryString">
    <p translate="WARN_Send_Link">
      You arrived via a link that has the address, amount, gas or data fields filled in for you. You can change any information before sending. Unlock your wallet to get started.
    </p>
  </div>


  <!-- Unlock Wallet -->
  <article class="collapse-container">
    <div >
      <div class="standart-block wallet-info-view-heder">
        <h1 class="h1" translate="NAV_SendEther">
	        Send Coins &amp; Tokens
	      </h1>
      </div>
    </div>
    <div ng-show="!wd">
         <article class="block decrypt-drtv clearfix" ng-controller='decryptWalletCtrl as $crtl'>

  <!-- Column 1 - Select Type of Key -->
  <section class="col-md-4 col-sm-6 wallet-auth">

    <h4 class="wallet-auth__title" style="padding-right: 40%;">
      Already have a wallet somewhere?
    </h4>

    <!-- View Balance Only -->
    <label aria-flowto="aria1"
           class="radio"
           ng-show="globalService.currentTab==globalService.tabs.sendTransaction.id || globalService.currentTab==globalService.tabs.viewWalletInfo.id">
      <input aria-flowto="aria1"
             aria-label="address"
             type="radio"
             class="radio__input" 
             ng-model="walletType"
             value="addressOnly" />
             <span class="radio__cheched-dot"></span>
        View w/ Address Only
    </label>


    <!-- MetaMask -->
    <label aria-flowto="aria2"
           class="radio">
      <input aria-flowto="aria2"
             type="radio"
             aria-label="MetaMask / Mist"
             ng-model="walletType"
             class="radio__input" 
             value="metamask" />
             <span class="radio__cheched-dot"></span>
      <span translate="x_MetaMask">
        MetaMask / Mist
      </span>
    </label>

    <!-- Ledger -->
    <label aria-flowto="aria3"
           class="radio"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'||ajaxReq.type=='UBQ'||ajaxReq.type=='POA'||ajaxReq.type=='TOMO'||ajaxReq.type=='ESN'||ajaxReq.type=='AKA'||ajaxReq.type=='PIRL'||ajaxReq.type=='ETHO'||ajaxReq.type=='EGEM'||ajaxReq.type=='CLO'||ajaxReq.type=='ATH'||ajaxReq.type=='MUSIC'||ajaxReq.type=='EOSC'||ajaxReq.type=='GO'||ajaxReq.type=='MIX'||ajaxReq.type=='ILT'">
      <input aria-flowto="aria3"
             type="radio"
             aria-label="Ledger Hardware Wallet"
             class="radio__input" 
             ng-model="walletType"
             value="ledger"/>
             <span class="radio__cheched-dot"></span>
      Ledger Wallet
    </label>

    <!-- TREZOR -->
    <label class="radio"
           aria-flowto="aria4"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'||ajaxReq.type=='UBQ'||ajaxReq.type=='POA'||ajaxReq.type=='TOMO'||ajaxReq.type=='ELLA'||ajaxReq.type=='EGEM'||ajaxReq.type=='CLO'||ajaxReq.type=='ETSC'||ajaxReq.type=='MUSIC'||ajaxReq.type=='GO'||ajaxReq.type=='EOSC'||ajaxReq.type=='AKA'||ajaxReq.type=='ESN'||ajaxReq.type=='PIRL'||ajaxReq.type=='ETHO'||ajaxReq.type=='ATH'||ajaxReq.type=='ILT'">
      <input aria-flowto="aria4"
             type="radio"
             aria-label="Trezor Hardware Wallet"
             ng-model="walletType"
             class="radio__input" 
             value="trezor" />
             <span class="radio__cheched-dot"></span>
      TREZOR
    </label>

    <!-- Digital Bitbox -->
    <label aria-flowto="aria5"
           class="radio"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'">
      <input aria-flowto="aria5"
             type="radio"
             aria-label="Digital Bitbox hardware wallet"
             ng-model="walletType"
             class="radio__input" 
             value="digitalBitbox"/>
             <span class="radio__cheched-dot"></span>
      Digital Bitbox
    </label>

    <!-- Secalot -->
    <label aria-flowto="aria5"
           class="radio"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'">
      <input aria-flowto="aria5"
             type="radio"
             aria-label="Secalot hardware wallet"
             ng-model="walletType"
             class="radio__input" 
             value="secalot"/>
             <span class="radio__cheched-dot"></span>
      Secalot
    </label>

    <!-- Keystore / JSON File -->
    <label aria-flowto="aria6"
           class="radio">
      <input aria-flowto="aria6"
             aria-label="Keystore JSON file"
             type="radio"
             class="radio__input" 
             ng-model="walletType"
             value="fileupload" />
             <span class="radio__cheched-dot"></span>
      Keystore / JSON File

    </label>

    <!-- Mnemonic Phrase -->
    <label aria-flowto="aria7"
           class="radio">
      <input aria-flowto="aria7"
             aria-label="mnemonic phrase"
             type="radio"
             class="radio__input" 
             ng-model="walletType"
             value="pastemnemonic" />
             <span class="radio__cheched-dot"></span>
      <span translate="x_Mnemonic">
        Mnemonic Phrase
      </span>

    </label>

    <!-- Private -->
    <label aria-flowto="aria8"
           class="radio">
      <input aria-flowto="aria8"
             aria-label="private key"
             type="radio"
             class="radio__input" 
             ng-model="walletType"
             value="pasteprivkey" />
             <span class="radio__cheched-dot"></span>
      <span translate="x_PrivKey2">
        Private Key
      </span>

    </label>


  </section>
  <!-- / Column 1 - Select Type of Key -->


  <!-- Column 2 - Unlock That Key -->
  <section class="col-md-8 col-sm-6">

    <!-- View Only -->
    <div id="selectedTypeKey" class="wallet-login" ng-if="walletType=='addressOnly'">
      <h4 translate="x_Address" class="wallet-login__title">
        Your Address
      </h4>
      <h5 class="wallet-login__subtitle">
        This is a recommended way to view your balance.
      </h5>
      <p class="wallet-login__description text-muted">
          You can only view your balance via this option.
          Please use another option in order to send.
      </p>
      <div class="form-group">
        <textarea rows="4"
                  id="aria8"
                  class="form-control"
                  ng-change="onAddressChange()"
                  ng-class="Validator.isValidAddress($parent.$parent.addressOnly) ? 'is-valid' : 'is-invalid'"
                  ng-model="$parent.$parent.addressOnly"
        ></textarea>
      </div>
      <div class="form-group">
        <a class="btn btn-primary"
           ng-click="decryptAddressOnly()"
           ng-show="showAOnly"
           role="button"
           tabindex="0">
             View Balance
        </a>
      </div>
    </div>
    <!-- /View Only -->


    <!--  MetaMask -->
    <div id="selectedTypeMetamask"
         ng-if="walletType=='metamask'"
         class="wallet-login">
      <h4 translate="x_MetaMask" class="wallet-login__title">
        MetaMask / Mist
      </h4>
      <h5 class="wallet-login__subtitle">
        This is a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        MetaMask is a browser extension that allows you to access your wallet quickly, safely &amp; easily. It is more secure because you never enter your private key on a website. It protects you from phishing &amp; malicious websites.
      </div>
     <!--  <ul>
        <li class="u__protip">
          <a tabindex="0"
             href="https://kb.myetherwallet.com/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
                How to Move to MetaMask
          </a>
        </li>
        <li class="u__download">
          <a tabindex="0"
             href="https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en"
             target="_blank"
             rel="noopener noreferrer">
                Download MetaMask for Chrome
          </a>
        </li>
        <li class="u__download">
          <a tabindex="0"
             href="https://metamask.io/"
             target="_blank"
             rel="noopener noreferrer">
                Download MetaMask for Other Browsers
          </a>
        </li>
      </ul> -->
<!--       <div class="form-group"
           ng-hide="isSSL">
        <span class="text-danger"
              translate="ADD_Ledger_0a" >
            Please use MyEtherWallet on a secure (SSL / HTTPS) connection to connect.
        </span>
      </div> -->
      <div class="form-group">
        <a id="aria3"
           class="btn btn-primary"
           ng-click="scanMetamask()"
           ng-show="walletType=='metamask'"
           tabindex="0" role="button"
           translate="ADD_MetaMask">
             Connect to MetaMask
        </a>
      </div>
    </div>
    <!-- / MetaMask -->


    <!--  Ledger-->
    <div id="selectedTypeLedger" ng-if="walletType=='ledger'" class="wallet-login">
      <h4 class="wallet-login__title">
        Ledger Hardware Wallet
      </h4>
      <h5 class="wallet-login__subtitle">
        This is a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key never leaves the hardware wallet. It protects you from phishing, malware, and more.
      </div>
<!--       <ul>
        <li class="u__protip">
          <a href="https://ledger.zendesk.com/hc/en-us/articles/115005200009-How-to-use-MyEtherWallet-with-Ledger"
             target="_blank"
             rel="noopener noreferrer">
          How to use MyEtherWallet with your Ledger Hardware Wallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://www.ledger.com/products/ledger-nano-s?r=fa4b"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a Ledger? Get one today.
          </a>
        </li>
      </ul> -->
      <div class="form-group">
        <a class="btn btn-primary"
           ng-click="scanLedger()"
           ng-show="walletType=='ledger'"
           role="button"
           tabindex="0"
           translate="ADD_Ledger_scan">
            SCAN
        </a>
      </div>
      <div role="alert" ng-show="ledgerError">
        <p class="strong text-danger">
          {{ledgerErrorString}}
        </p>
        <ul>
          <li ng-hide="isSSL"
              translate="ADD_Ledger_0a" >
                Please use MyEtherWallet on a secure (SSL / HTTPS) connection to connect.
          </li>
          <li>
            <span translate="ADD_Ledger_2" ng-if="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'">
              Open the Ethereum application (or a contract application)
            </span>
            <span translate="ADD_Ledger_2_Exp" ng-if="ajaxReq.type=='EXP'">
              Open the Expanse application (or a contract application)
            </span>
            <span translate="ADD_Ledger_2_Ubq" ng-if="ajaxReq.type=='UBQ'">
              Open the Ubiq application (or a contract application)
            </span>
          </li>
          <li>
            <a href="https://kb.myetherwallet.com/hardware-wallets/ledger-hardware-wallet-unable-to-connect-on-myetherwallet.html"
             target="_blank"
             rel="noopener noreferrer">
                Still not working? More Troubleshooting Tips
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- / Ledger-->


    <!--  TREZOR-->
    <div id="selectedTypeTrezor" ng-if="walletType=='trezor'" class="wallet-login">
      <h4 class="wallet-login__title">
        TREZOR Hardware Wallet
      </h4>
      <h5 class="wallet-login__subtitle">
        This is a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key never leaves the hardware wallet. It protects you from phishing, malware, and more.
      </div>
<!--       <ul>
        <li class="u__protip">
          <a href="https://blog.trezor.io/trezor-integration-with-myetherwallet-3e217a652e08#.n5fddxmdg"
             target="_blank"
             rel="noopener noreferrer">
               How to use TREZOR with MyEtherWallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://trezor.io/?a=myetherwallet.com"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a TREZOR? Get one now.
          </a>
        </li>
      </ul> -->
      <div class="form-group">
        <a id="aria7"
           class="btn btn-primary"
           ng-click="scanTrezor()"
           ng-show="walletType=='trezor'"
           tabindex="0" role="button"
           translate="ADD_Trezor_scan">
            Connect to TREZOR
        </a>
      </div>
      <div role="alert" ng-show="trezorError">
        <p class="strong text-danger">
          {{trezorErrorString}}
        </p>
        <ul>
          <li ng-hide="isSSL"
              translate="ADD_Ledger_0a" >
                Please use MyEtherWallet on a secure (SSL / HTTPS) connection to connect.
          </li>
          <li>
                Ensure you are not blocking pop-ups on this site.
          </li>
          <li>
            <a href="https://kb.myetherwallet.com/hardware-wallets/"
             target="_blank"
             rel="noopener noreferrer">
                Still not working? More Troubleshooting Tips
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- / TREZOR-->


    <!--  Digital Bitbox-->
    <div id="selectedTypeDigitalBitbox" ng-if="walletType=='digitalBitbox'" class="wallet-login">
      <h4 class="wallet-login__title">
        Digital Bitbox Hardware Wallet
      </h4>
      <div class="wallet-login__description">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key never leaves the hardware wallet. It protects you from phishing, malware, and more.
      </div>
<!--       <ul>
        <li class="u__protip">
          <a href="https://digitalbitbox.com/ethereum"
             target="_blank"
             rel="noopener noreferrer">
               How to use Digital Bitbox with MyEtherWallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://digitalbitbox.com/?ref=mew"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a Digital Bitbox? Get one now.
          </a>
        </li>
      </ul> -->
      <label for="">
      	<h3 style="margin: 0; margin-top: 20px;">
       Digital Bitbox password
      	</h3>
	      <input class="form-control"
	      		style="margin: 0;"
	             aria-label="Enter the Digital Bitbox password"
	             aria-describedby="selectedTypeDigitalBitbox"
	             type="password"
	             spellcheck="false"
	             value=""
	             ng-model="HDWallet.digitalBitboxSecret" />
       </label>
      <div class="form-group">
        <a tabindex="0" role="button" class="btn btn-primary" ng-click="scanDigitalBitbox()" translate="ADD_DigitalBitbox_scan">
          Create New Wallet
        </a>
      </div>
    </div>
    <!-- / Digital Bitbox-->


    <!--  Secalot-->
    <div id="selectedTypeSecalot" ng-if="walletType=='secalot'" class="wallet-login">
      <h4 class="wallet-login__title">
        Secalot Hardware Wallet
      </h4>
      <h5 class="wallet-login__subtitle">
        This is a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key never leaves the hardware wallet. It protects you from phishing, malware, and more.
      </div>
<!--       <ul>
        <li class="u__protip">
          <a href="https://www.secalot.com/documentation/ethereum-wallet/"
             target="_blank"
             rel="noopener noreferrer">
               How to use Secalot with MyEtherWallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://secalot.com/?ref=mew"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a Secalot? Get one now.
          </a>
        </li>
      </ul> -->
      <input class="form-control"
             aria-label="Enter your Secalot Ethereum wallet PIN-code"
             aria-describedby="selectedTypeSecalot"
             type="password"
             placeholder="Secalot Ethereum wallet PIN-code"
             spellcheck="false"
             value=""
             ng-model="HDWallet.secalotSecret" />
      <div class="form-group">
        <a tabindex="0" role="button" class="btn btn-primary" ng-click="scanSecalot()" translate="ADD_Secalot_scan">
          Connect your Secalot
        </a>
      </div>
    </div>
    <!-- / Secalot-->

    <!--  Mew Connect -->
    <!-------------------------------  Mew Connect (Start) ------------------------------------------>
   
    <!-------------------------------  Mew Connect (End) ------------------------------------------>
    <!-- / Mew Connect -->

    <!-- Keystore -->
    <div ng-if="walletType=='fileupload'" class="wallet-login">
      <h4 translate="ADD_Radio_2_alt" class="wallet-login__title">Select your wallet file</h4>
      <h5 class="wallet-login__subtitle">
        This is not a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        Entering your private key on a website dangerous. If our website is compromised or you accidentally visit a different website, your funds will be stolen. Please consider:
      </div>
      <ul class="wallet-login__list">
        <li>
          <a href="https://kb.myetherwallet.com/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
              MetaMask
          </a>
          or
          <a href="https://kb.myetherwallet.com/hardware-wallets/hardware-wallet-recommendations.html"
             target="_blank"
             rel="noopener noreferrer">
              A Hardware Wallet
          </a>
          or
          <a href="https://kb.myetherwallet.com/offline/running-myetherwallet-locally.html"
             target="_blank"
             rel="noopener noreferrer">
              Running MEW Offline &amp; Locally
          </a>
        </li>
        <li>
          <a href="https://kb.myetherwallet.com/getting-started/protecting-yourself-and-your-funds.html"
             target="_blank"
             rel="noopener noreferrer">
              Learning How to Protect Yourself and Your Funds
          </a>
        </li>
      </ul>
      <div class="wallet-login__description text-muted">
        If you must, please double-check the URL &amp; SSL cert. It should say https://www.myetherwallet.com &amp; MYETHERWALLET INC in your URL bar.
      </div>
      <div class="form-group">
        <input style="display:none;" type="file" on-read-file="showContent($fileContent)" id="fselector" />
        <a class="btn marg-v-sm"
           ng-click="openFileDialog()"
           translate="ADD_Radio_2_short"
           id="aria1"
           tabindex="0"
           role="button">select wallet file... </a>
      </div>
      <div class="form-group" ng-if="requireFPass" >
        <p translate="ADD_Label_3">
          Your file is encrypted. Please enter the password:
        </p>
        <input class="form-control"
               ng-change="onFilePassChange()"
               ng-class="Validator.isPasswordLenValid($parent.$parent.filePassword,0) ? 'is-valid' : 'is-invalid'"
               ng-model="$parent.$parent.filePassword"
               placeholder="{{ 'x_Password' | translate }}"
               type="password" />
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Keystore -->


    <!--  Mnemonic -->
    <div id="selectedTypeMnemonic" ng-if="walletType=='pastemnemonic'" class="wallet-login">
      <h4 translate="ADD_Radio_5" class="wallet-login__title"> Paste your mnemonic: </h4>
      <h5 class="wallet-login__subtitle">
        This is not a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        Entering your private key on a website dangerous. If our website is compromised or you accidentally visit a different website, your funds will be stolen. Please consider:
      </div>
       <ul class="wallet-login__list">
        <li>
          <a href="https://kb.myetherwallet.com/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
              MetaMask
          </a>
          or
          <a href="https://kb.myetherwallet.com/hardware-wallets/hardware-wallet-recommendations.html"
             target="_blank"
             rel="noopener noreferrer">
              A Hardware Wallet
          </a>
          or
          <a href="https://kb.myetherwallet.com/offline/running-myetherwallet-locally.html"
             target="_blank"
             rel="noopener noreferrer">
              Running MEW Offline &amp; Locally
          </a>
        </li>
        <li>
          <a href="https://kb.myetherwallet.com/getting-started/protecting-yourself-and-your-funds.html"
             target="_blank"
             rel="noopener noreferrer">
              Learning How to Protect Yourself and Your Funds
          </a>
        </li>
      </ul>
      <div class="wallet-login__description text-muted">
        If you must, please double-check the URL &amp; SSL cert. It should say https://www.myetherwallet.com &amp; MYETHERWALLET INC in your URL bar.
      </div>
      <div class="form-group">
        <textarea id="aria4"
       			  style="height: 47px; line-height: 37px; resize: none; overflow: hidden" 
                  class="form-control"
                  ng-change="onMnemonicChange()"
                  ng-class="Validator.isValidMnemonic($parent.$parent.manualmnemonic) ? 'is-valid' : 'is-invalid'"
                  ng-keyup="$event.keyCode == 13 && decryptWallet()"
                  ng-model="$parent.$parent.manualmnemonic"
                  placeholder="{{ 'x_Mnemonic' | translate}}"
                  rows="4"></textarea>
      </div>
      <div class="form-group">
        <div>
          <input class="form-control"
                 id="aria5"
                 ng-keyup="$event.keyCode == 13 && decryptWallet()"
                 ng-model="$parent.$parent.mnemonicPassword"
                 placeholder="{{ 'x_Password' | translate }}"
                 type="password" />
        </div>
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Mnemonic -->


    <!--  Private Key -->
    <div id="selectedTypeKey" ng-if="walletType=='pasteprivkey'" class="wallet-login">
      <h4 translate="ADD_Radio_3" class="wallet-login__title">
        Paste your private key:
      </h4>
      <h5 class="wallet-login__subtitle">
        This is not a recommended way to access your wallet.
      </h5>
      <div class="wallet-login__description text-muted">
        Entering your private key on a website is dangerous. If our website is compromised or you accidentally visit a different website, your funds will be stolen. Please consider:
      </div>
      <ul class="wallet-login__list">
        <li>
          <a href="https://kb.myetherwallet.com/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
              MetaMask
          </a>
          or
          <a href="https://kb.myetherwallet.com/hardware-wallets/hardware-wallet-recommendations.html"
             target="_blank"
             rel="noopener noreferrer">
              A Hardware Wallet
          </a>
          or
          <a href="https://kb.myetherwallet.com/offline/running-myetherwallet-locally.html"
             target="_blank"
             rel="noopener noreferrer">
              Running MEW Offline &amp; Locally
          </a>
        </li>
        <li>
          <a href="https://kb.myetherwallet.com/getting-started/protecting-yourself-and-your-funds.html"
             target="_blank"
             rel="noopener noreferrer">
              Learning How to Protect Yourself and Your Funds
          </a>
        </li>
      </ul>
      <div class="wallet-login__description text-muted">
        If you must, please double-check the URL &amp; SSL cert. It should say https://www.myetherwallet.com &amp; MYETHERWALLET INC in your URL bar.
      </div>
      <div class="form-group">
        <textarea id="aria6"
        			style="height: 47px; line-height: 37px; resize: none; overflow: hidden" 
                  class="form-control"
                  ng-change="onPrivKeyChange()"
                  ng-class="Validator.isValidPrivKey($parent.$parent.manualprivkey.length) ? 'is-valid' : 'is-invalid'"
                  ng-keyup="$event.keyCode == 13 && decryptWallet()"
                  ng-model="$parent.$parent.manualprivkey"
                  placeholder="{{ 'x_PrivKey2' | translate }}"
                  rows="4"
        ></textarea>
      </div>
      <div class="form-group" ng-if="requirePPass">
        <p translate="ADD_Label_3">
          Your file is encrypted. Please enter the password:
        </p>
        <input class="form-control"
               ng-change="onPrivKeyPassChange()"
               ng-class="Validator.isPasswordLenValid($parent.$parent.privPassword,0) ? 'is-valid' : 'is-invalid'"
               ng-keyup="$event.keyCode == 13 && decryptWallet()"
               ng-model="$parent.$parent.privPassword"
               placeholder="{{ 'x_Password' | translate }}"
               type="password" />
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Private Key -->

  </section>
  <!-- / Column 2 - Unlock That Key -->


  <!-- MODAL -->
  <article class="modal fade" id="mnemonicModel" tabindex="-1" role="dialog" aria-labelledby="Mnemonic Phrase Modal">

    <section class="modal-dialog">

      <section class="modal-content">

        <div class="modal-body" role="document">

          <button aria-label="Close" type="button" class="close" data-dismiss="modal">&times;</button>

          <!-- Select HD Path -->
          <h4 id="modalTitle" class="modal-title" translate="ADD_Radio_5_Path" style="margin-bottom: .25rem">
            Select HD derivation path:
          </h4>

          <p class="alert alert-danger"
             ng-hide="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'||ajaxReq.type=='UBQ'||ajaxReq.type=='ELLA'||ajaxReq.type=='EGEM'||ajaxReq.type=='CLO'||ajaxReq.type=='ETSC'||ajaxReq.type=='MUSIC'||ajaxReq.type=='GO'||ajaxReq.type=='EOSC'||ajaxReq.type=='POA'||ajaxReq.type=='AKA'||ajaxReq.type=='ESN'||ajaxReq.type=='PIRL'||ajaxReq.type=='ETHO'||ajaxReq.type=='ATH'||ajaxReq.type=='MIX'||ajaxReq.type=='ILT'">
                We do not know the correct path for this network.
                <a href="https://github.com/kvhnuke/etherwallet/issues"
                   target="_blank"
                   rel="noopener noreferrer">
                      Please open a github issue
                </a>
                so we can discuss / be enlightened.
          </p>

          <section class="row">

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: Jaxx, Metamask, Exodus, imToken - {{HDWallet.defaultDPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.defaultDPath}}"/>
                <span ng-bind="HDWallet.defaultDPath"></span>
                <span class="radio__cheched-dot"></span>
                <p class="small" >
                  Jaxx, Metamask, Exodus, imToken, TREZOR (ETH) &amp; Digital Bitbox
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: Ledger (ETH) {{HDWallet.ledgerPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.ledgerPath}}"/>
                <span ng-bind="HDWallet.ledgerPath"></span>
                <span class="radio__cheched-dot"></span>
              <p class="small" >
                  Ledger (ETH)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: Ledger (ETC) {{HDWallet.ledgerClassicPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.ledgerClassicPath}}"/>
                <span ng-bind="HDWallet.ledgerClassicPath"></span>
                <span class="radio__cheched-dot"></span> <span class="radio__cheched-dot"></span> <p class="small"  >
                  Ledger (ETC)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETC) {{HDWallet.trezorClassicPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.trezorClassicPath}}"/>
                <span ng-bind="HDWallet.trezorClassicPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  TREZOR (ETC)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: SingularDTV {{HDWallet.singularDTVPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.singularDTVPath}}"/>
                <span ng-bind="HDWallet.singularDTVPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  SingularDTV
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR - TESTNET - {{HDWallet.trezorTestnetPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.trezorTestnetPath}}"/>
                <span ng-bind="HDWallet.trezorTestnetPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Testnets
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETC) {{HDWallet.hwExpansePath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwExpansePath}}"/>
                <span ng-bind="HDWallet.hwExpansePath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Expanse
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETC) {{HDWallet.hwUbqPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwUbqPath}}"/>
                <span ng-bind="HDWallet.hwUbqPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Ubiq
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ELLA) {{HDWallet.hwEllaismPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEllaismPath}}"/>
                <span ng-bind="HDWallet.hwEllaismPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Ellaism
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (EGEM) {{HDWallet.hwEtherGemPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEtherGemPath}}"/>
                <span ng-bind="HDWallet.hwEtherGemPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: EtherGem
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (CLO) {{HDWallet.hwCallistoPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwCallistoPath}}"/>
                <span ng-bind="HDWallet.hwCallistoPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Callisto
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETSC) {{HDWallet.hwSocialPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwSocialPath}}"/>
                <span ng-bind="HDWallet.hwSocialPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Ethereum Social
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (MUSIC) {{HDWallet.hwMusicoinPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwMusicoinPath}}"/>
                <span ng-bind="HDWallet.hwMusicoinPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Musicoin
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (GO) {{HDWallet.goPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.goPath}}"/>
                <span ng-bind="HDWallet.goPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: GoChain
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (EOSC) {{HDWallet.hwEOSClassicPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEOSClassicPath}}"/>
                <span ng-bind="HDWallet.hwEOSClassicPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: EOS Classic
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (Akroma) {{HDWallet.hwAkromaPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwAkromaPath}}"/>
                <span ng-bind="HDWallet.hwAkromaPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Akroma (AKA)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ESN) {{HDWallet.hwESNetworkPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwESNetworkPath}}"/>
                <span ng-bind="HDWallet.hwESNetworkPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: EtherSocial Network (ESN)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
                <label class="radio small">
                    <input aria-describedby="Path: Ledger (PIRL) {{HDWallet.hwPirlPath}}"
                           ng-change="onHDDPathChange()"
                           ng-model="HDWallet.dPath"
                           type="radio"
                           value="{{HDWallet.hwPirlPath}}"/>
                    <span ng-bind="HDWallet.hwPirlPath"></span>
                    <span class="radio__cheched-dot"></span> <p class="small" >Network: PIRL</p>
                </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETHO) {{HDWallet.hwEther1Path}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEther1Path}}"/>
                <span ng-bind="HDWallet.hwEther1Path"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Ether-1 (ETHO)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ATH) {{HDWallet.hwAtheiosPath}}"
                        ng-change="onHDDPathChange()"
                        ng-model="HDWallet.dPath"
                        type="radio"
                       value="{{HDWallet.hwAtheiosPath}}"/>
                <span ng-bind="HDWallet.hwAtheiosPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Atheios (ATH)
                </p>
               </label>
            </div>
            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (TOMO) {{HDWallet.tomoPath}}"
                        ng-change="onHDDPathChange()"
                        ng-model="HDWallet.dPath"
                        type="radio"
                       value="{{HDWallet.tomoPath}}"/>
                <span ng-bind="HDWallet.tomoPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: TomoChain (TOMO)
                </p>
              </label>
            </div>
            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (MIX) {{HDWallet.hwMixPath}}"
                        ng-change="onHDDPathChange()"
                        ng-model="HDWallet.dPath"
                        type="radio"
                       value="{{HDWallet.hwMixPath}}"/>
                <span ng-bind="HDWallet.hwMixPath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Mix Blockchain (MIX)
                </p>
               </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ILT) {{HDWallet.hwIolitePath}}"
                        ng-change="onHDDPathChange()"
                        ng-model="HDWallet.dPath"
                        type="radio"
                       value="{{HDWallet.hwIolitePath}}"/>
                <span ng-bind="HDWallet.hwIolitePath"></span>
                <span class="radio__cheched-dot"></span> <p class="small" >
                  Network: Iolite (ILT)
                </p>
               </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                 <p class="small" ><strong>
                  Your Custom Path
                </strong></p>
                <input aria-describedby="Path: Enter your own - {{HDWallet.customDPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.customDPath}}" />
                <input aria-describedby="Path: Enter your own - {{HDWallet.customDPath}}"
                      type="text" class="form-control input-sm"
                      ng-model="HDWallet.customDPath"
                      ng-change="onCustomHDDPathChange()"
                      style="float: right;margin: 0 0 .5rem;" />
                      <span class="radio__cheched-dot"></span>
              </label>
            </div>
          </section>



          <h4 id="modalTitle2" class="modal-title" translate="MNEM_1" style="margin: .5rem 0">
            Please select the address you would like to interact with.
          </h4>

          <table class="small table table-striped table-mnemonic">
            <tr>
              <th translate="x_Address">
                Address
              </th>
              <th translate="MYWAL_Bal">
                Balance
              </th>
              <th translate="sidebar_TokenBal" class="text-center">
                Token<br>Balances
              </th>
            </tr>
            <tr ng-repeat="wallet in HDWallet.wallets track by $index">
              <td>
                <label>
                  <input aria-describedby="modalTitle2"
                         aria-label="Unlock wallet with {{wallet.getBalance()}} {{ajaxReq.type}}. Address: {{wallet.getChecksumAddressString()}}"
                         name="addressSelect"
                         ng-model="HDWallet.id"
                         type="radio"
                         value="{{$index}}" />
                    <span class="small">
                      {{wallet.getChecksumAddressString()}}
                    </span>
                </label>
              </td>

              <td>
                <a href="{{ajaxReq.blockExplorerAddr.replace('[[address]]', wallet.getAddressString())}}"
                   target="_blank"
                   rel="noopener noreferrer">
                  {{wallet.getBalance()}} {{ajaxReq.type}}
                </a>
              </td>

              <td class="text-center">
                <a href="https://ethplorer.io/address/{{wallet.getAddressString()}}"
                   target="_blank"
                   rel="noopener noreferrer" title="https://ethplorer.io/address/{{wallet.getAddressString()}}">
                  <img src="images/icon-external-link.svg" title="https://ethplorer.io/address/{{wallet.getAddressString()}}" ng-click="removeTokenFromLocal(token.symbol)" ng-show="token.type!=='default'" />
                </a>
              </td>

            </tr>

            <tr class="m-addresses">

              <td>
                <a ng-click="AddRemoveHDAddresses(false)"
                   ng-show="HDWallet.numWallets > 5"
                   role="link"
                   tabindex="0"
                   translate="MNEM_prev">
                Previous Addresses
                </a>
              </td>

              <td></td>

              <td>
                <a ng-click="AddRemoveHDAddresses(true)"
                   role="link"
                   tabindex="0"
                   translate="MNEM_more">
                More Addresses
                </a>
              </td>

            </tr>
          </table>

          <div class="clearfix button-group">
            <button aria-label="Unlock this Wallet"
                    class="btn btn-primary pull-right"
                    style="margin: 0 .1rem"
                    ng-click="setHDWallet()"
                    role="button"
                    tabindex="0"
                    translate="ADD_Label_6">
              Access Wallet
            </button>

            <button aria-label="Cancel - Will close dialog"
                    class="btn btn-default pull-right"
                    style="margin: 0 .1rem"
                    data-dismiss="modal"
                    role="button"
                    tabindex="0"
                    translate="x_Cancel">
              Cancel
            </button>
          </div>

        </div>

      </section>

    </section>

  </article>

</article>

    </div>
  </article>


  <!-- Send Tx Content -->
  <article class="row" ng-show="wallet!=null">
	@@include( './sendTx-content.tpl', { "site": "mew" } )

     @@include( './sendTx-modal.tpl',   { "site": "mew" } )
  </article>


</main>
