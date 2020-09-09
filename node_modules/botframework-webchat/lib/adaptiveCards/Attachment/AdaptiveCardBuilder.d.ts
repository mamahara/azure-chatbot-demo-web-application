import { AdaptiveCard, CardElement, Column, Container, TextBlock } from 'adaptivecards';
import { CardAction } from 'botframework-directlinejs';
export interface BotFrameworkCardAction {
    __isBotFrameworkCardAction: boolean;
    cardAction: CardAction;
}
export default class AdaptiveCardBuilder {
    card: AdaptiveCard;
    container: Container;
    styleOptions: any;
    constructor(adaptiveCards: any, styleOptions: any, direction?: string);
    addColumnSet(sizes: number[], container?: Container): Column[];
    addItems(cardElements: CardElement[], container?: Container): void;
    addTextBlock(text: string, template: Partial<TextBlock>, container?: Container): void;
    addButtons(cardActions: CardAction[], includesOAuthButtons?: boolean): void;
    addCommonHeaders(content: ICommonContent): void;
    addCommon(content: ICommonContent): void;
    addImage(url: string, container?: Container, selectAction?: CardAction): void;
}
export interface ICommonContent {
    buttons?: CardAction[];
    subtitle?: string;
    text?: string;
    title?: string;
}
