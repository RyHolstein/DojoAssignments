import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TimwzoneComponent } from './timwzone.component';

describe('TimwzoneComponent', () => {
  let component: TimwzoneComponent;
  let fixture: ComponentFixture<TimwzoneComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TimwzoneComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TimwzoneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
