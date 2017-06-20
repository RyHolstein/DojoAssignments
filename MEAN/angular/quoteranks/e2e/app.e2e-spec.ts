import { QuoteranksPage } from './app.po';

describe('quoteranks App', () => {
  let page: QuoteranksPage;

  beforeEach(() => {
    page = new QuoteranksPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
