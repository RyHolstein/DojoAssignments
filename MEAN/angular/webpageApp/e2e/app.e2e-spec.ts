import { WebpageAppPage } from './app.po';

describe('webpage-app App', () => {
  let page: WebpageAppPage;

  beforeEach(() => {
    page = new WebpageAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
