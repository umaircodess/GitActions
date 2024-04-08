import { LightningElement , track} from 'lwc';
import {
    subscribe,
    unsubscribe,
    onError,
} from 'lightning/empApi';

export default class EmpApiLWC extends LightningElement {
    @track msgBody = '';
    channelName = '/data/Student__ChangeEvent';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

    subscription = {};

    handleChannelName(event) {
        this.channelName = event.target.value;
    }

    connectedCallback() {
        this.registerErrorListener();
    }


    handleSubscribe() {
        const ref=this;
        const messageCallback = function(response) {
            // const payload = response.data.payload;
            // const changeEventHeader = payload.ChangeEventHeader;
            // const formattedMessage = {
            //     LastModifiedDate: payload.LastModifiedDate,
            //     Name: payload.Name,
            //      ChangeEventHeader: changeEventHeader
            // };
            ref.msgBody = JSON.stringify(response, null, 2);
            // console.log("###New message received ", ref.msgBody);
            // console.log('New message received: ', JSON.stringify(response));
            // Response contains the payload of the new message received
        };
        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then((response) => {
            console.log('Subscription request sent to: ',JSON.stringify(response.channel));
            this.subscription = response;
            this.toggleSubscribeButton(true);
        });
    }

    handleUnsubscribe() {
        this.toggleSubscribeButton(false);
        unsubscribe(this.subscription, (response) => {
            console.log('unsubscribe() response: ', JSON.stringify(response));
        });
    }

    toggleSubscribeButton(TRU) {
        this.isSubscribeDisabled = TRU;
        this.isUnsubscribeDisabled = !TRU;
    }

    registerErrorListener() {
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
        });
    }
}