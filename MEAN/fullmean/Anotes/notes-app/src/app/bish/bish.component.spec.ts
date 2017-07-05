import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BishComponent } from './bish.component';

describe('BishComponent', () => {
  let component: BishComponent;
  let fixture: ComponentFixture<BishComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BishComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BishComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
