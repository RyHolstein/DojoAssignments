import { NotesAppPage } from './app.po';

describe('notes-app App', () => {
  let page: NotesAppPage;

  beforeEach(() => {
    page = new NotesAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
